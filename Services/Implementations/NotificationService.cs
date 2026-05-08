using DaNangSafeMap.Data;
using DaNangSafeMap.Models.Entities;
using Microsoft.EntityFrameworkCore;

namespace DaNangSafeMap.Services.Implementations
{
    public class NotificationService
    {
        private readonly ApplicationDbContext _db;
        public NotificationService(ApplicationDbContext db) => _db = db;

        // Tạo thông báo mới
        public async Task CreateAsync(int userId, string type, string title, string message, string? link = null)
        {
            var notif = new Notification
            {
                UserId    = userId,
                Type      = type,
                Title     = title,
                Message   = message,
                Link      = link,
                IsRead    = false,
                CreatedAt = DateTime.Now
            };
            _db.Notifications.Add(notif);
            await _db.SaveChangesAsync();
        }

        // Lấy thông báo chưa đọc của user (tối đa 20)
        public async Task<List<Notification>> GetUnreadAsync(int userId)
        {
            return await _db.Notifications
                .Where(n => n.UserId == userId && !n.IsRead)
                .OrderByDescending(n => n.CreatedAt)
                .Take(20)
                .ToListAsync();
        }

        // Lấy tất cả thông báo gần đây (đọc + chưa đọc, 30 cái)
        public async Task<List<Notification>> GetRecentAsync(int userId)
        {
            return await _db.Notifications
                .Where(n => n.UserId == userId)
                .OrderByDescending(n => n.CreatedAt)
                .Take(30)
                .ToListAsync();
        }

        // Đánh dấu 1 thông báo đã đọc
        public async Task MarkReadAsync(int id, int userId)
        {
            var n = await _db.Notifications.FirstOrDefaultAsync(x => x.Id == id && x.UserId == userId);
            if (n != null) { n.IsRead = true; await _db.SaveChangesAsync(); }
        }

        // Đánh dấu tất cả đã đọc
        public async Task MarkAllReadAsync(int userId)
        {
            var unread = await _db.Notifications
                .Where(n => n.UserId == userId && !n.IsRead)
                .ToListAsync();
            unread.ForEach(n => n.IsRead = true);
            await _db.SaveChangesAsync();
        }

        // Đếm chưa đọc
        public async Task<int> CountUnreadAsync(int userId)
        {
            return await _db.Notifications
                .CountAsync(n => n.UserId == userId && !n.IsRead);
        }
    }
}
