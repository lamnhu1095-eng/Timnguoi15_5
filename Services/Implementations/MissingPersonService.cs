using DaNangSafeMap.Data;
using DaNangSafeMap.Models.Entities;
using DaNangSafeMap.Models.ViewModels.MissingPerson;
using DaNangSafeMap.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DaNangSafeMap.Services.Implementations
{
    public class MissingPersonService : IMissingPersonService
    {
        private readonly ApplicationDbContext _db;

        public MissingPersonService(ApplicationDbContext db)
        {
            _db = db;
        }

        // Lấy tất cả bài đăng đang active (Status=1) và chưa bị xóa
        public async Task<List<MissingPerson>> GetAllActiveAsync()
        {
            return await _db.MissingPersons
                .Include(m => m.User)
                .Where(m => m.Status != 4 && m.DeletedAt == null)
                .OrderByDescending(m => m.CreatedAt)
                .ToListAsync();
        }

        // Lấy chi tiết 1 bài
        public async Task<MissingPerson?> GetByIdAsync(int id)
        {
            return await _db.MissingPersons
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.Id == id && m.DeletedAt == null);
        }

        // Tạo bài đăng mới
        public async Task<MissingPerson> CreateAsync(CreateMissingPersonViewModel model, int userId, string imageUrl)
        {
            // Ghép thông tin vào Description theo format: Tuổi|Giới tính|Chiều cao|Đặc điểm|Liên hệ|Nội dung
            var fullDesc = $"TUOI:{model.Age}|GIOITINH:{model.Gender}|CHIEUCAO:{model.Height}|DACBIET:{model.Features}|LIENHE:{model.ContactInfo}|NOIDUNG:{model.Description}";

            var person = new MissingPerson
            {
                UserId = userId,
                FullName = model.FullName,
                Description = fullDesc,
                LastSeenLocation = model.LastSeenLocation,
                ImageUrl = imageUrl,
                Status = 1, // Đang tìm
                CreatedAt = DateTime.Now
            };

            _db.MissingPersons.Add(person);
            await _db.SaveChangesAsync();
            return person;
        }

        // Xóa bài (soft delete)
        public async Task<bool> DeleteAsync(int id, int userId)
        {
            var person = await _db.MissingPersons.FirstOrDefaultAsync(m => m.Id == id && m.UserId == userId);
            if (person == null) return false;

            person.DeletedAt = DateTime.Now;
            person.Status = 4; // Deleted
            await _db.SaveChangesAsync();
            return true;
        }
    }
}
