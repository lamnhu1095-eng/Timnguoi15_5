using DaNangSafeMap.Models.Entities;

namespace DaNangSafeMap.Models.ViewModels.MissingPerson
{
    public class MissingPersonIndexViewModel
    {
        // Danh sách kết quả sau khi lọc
        public List<DaNangSafeMap.Models.Entities.MissingPerson> Items { get; set; } = new();

        // --- Tham số tìm kiếm / lọc ---
        public string? Keyword { get; set; }          // Tìm theo tên / địa điểm
        public string? AgeGroup { get; set; }          // "child" | "adult" | "elderly"
        public string? Gender { get; set; }            // "Nam" | "Nữ" | "Khác"
        public int? DaysAgo { get; set; }              // Khoảng thời gian: 1 / 3 / 7 / 30
        public string SortBy { get; set; } = "newest"; // "newest" | "near72h"

        // --- Thống kê ---
        public int TotalCount { get; set; }
        public int SearchingCount { get; set; }
        public int FoundCount { get; set; }
        public int Near72hCount { get; set; }          // Số vụ sắp đến mốc 72h
        public int MyPostsCount { get; set; }          // Số bài của user hiện tại (server-side)
    }
}
