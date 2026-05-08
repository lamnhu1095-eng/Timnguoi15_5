using DaNangSafeMap.Data;
using DaNangSafeMap.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace DaNangSafeMap.Services.Implementations
{
    public class ClueService
    {
        private readonly ApplicationDbContext _db;
        private readonly NotificationService _notif;

        public ClueService(ApplicationDbContext db, NotificationService notif)
        {
            _db = db;
            _notif = notif;
        }

        // Lấy tất cả manh mối của 1 bài đăng (mới nhất trước)
        public async Task<List<Clue>> GetByMissingPersonAsync(int missingPersonId)
        {
            return await _db.Clues
                .Include(c => c.User)
                .Where(c => c.MissingPersonId == missingPersonId)
                .OrderByDescending(c => c.CreatedAt)
                .ToListAsync();
        }

        // Tạo manh mối mới
        public async Task<Clue> CreateAsync(int missingPersonId, int? userId,
            string seenLocation, DateTime seenAt, string content,
            string? phone, string? imageUrl)
        {
            // Pack toàn bộ vào Description (bảng clues không có cột riêng cho thời gian thấy / phone)
            var packed = $"SEEN_AT:{seenAt:yyyy-MM-dd HH:mm}|PHONE:{phone ?? ""}|CONTENT:{content}";

            try {
                Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, "ALTER TABLE `clues` DROP FOREIGN KEY `FK_Clue_User`;");
            } catch { }
            try {
                Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, "ALTER TABLE `clues` MODIFY COLUMN `UserId` int NULL;");
            } catch { }

            var clue = new Clue
            {
                MissingPersonId = missingPersonId,
                UserId = userId,
                Description = packed,
                Location = seenLocation,
                ImageUrl = imageUrl,
                CreatedAt = DateTime.Now
            };
            _db.Clues.Add(clue);
            await _db.SaveChangesAsync();

            // Gửi thông báo cho chủ bài đăng
            var post = await _db.MissingPersons
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.Id == missingPersonId);
            if (post != null)
            {
                string senderLabel = userId.HasValue
                    ? (await _db.Users.FindAsync(userId.Value))?.FullName ?? "Ai đó"
                    : "Người ẩn danh";
                await _notif.CreateAsync(
                    userId: post.UserId,
                    type: "clue",
                    title: "Manh mối mới",
                    message: $"{senderLabel} vừa gửi manh mối cho bài đăng \u201c{post.FullName}\u201d",
                    link: $"/MissingPerson/Details/{missingPersonId}#clues"
                );
            }

            return clue;
        }

        // Helper: tách từng field ra từ Description
        public static string GetField(string? desc, string key)
        {
            if (string.IsNullOrEmpty(desc)) return "";
            foreach (var part in desc.Split('|'))
                if (part.StartsWith(key + ":")) return part[(key.Length + 1)..];
            return "";
        }
    }
}
