using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using DaNangSafeMap.Data;
using DaNangSafeMap.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace DaNangSafeMap.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _db;
        private readonly IReportService _reportService;

        public AdminController(ApplicationDbContext db, IReportService reportService)
        {
            _db = db;
            _reportService = reportService;
        }

        // GET: /Admin/Dashboard
        [HttpGet]
        public IActionResult Dashboard()
        {
            return View();
        }

        // GET: /Admin/MissingPersons
        [HttpGet]
        public async Task<IActionResult> MissingPersons(string? search, string? status, int page = 1)
        {
            int pageSize = 10;
            var query = _db.MissingPersons
                .Include(m => m.User)
                .Where(m => m.DeletedAt == null);

            if (!string.IsNullOrWhiteSpace(search))
                query = query.Where(m => m.FullName.Contains(search) || m.LastSeenLocation.Contains(search));

            if (!string.IsNullOrWhiteSpace(status) && int.TryParse(status, out int s))
                query = query.Where(m => m.Status == s);

            var totalCount = await query.CountAsync();
            var items = await query
                .OrderByDescending(m => m.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.TotalCount  = totalCount;
            ViewBag.Page        = page;
            ViewBag.PageSize    = pageSize;
            ViewBag.TotalPages  = (int)Math.Ceiling((double)totalCount / pageSize);
            ViewBag.Search      = search ?? "";
            ViewBag.Status      = status ?? "";

            return View(items);
        }

        // POST: /Admin/DeleteMissingPerson/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteMissingPerson(int id)
        {
            var person = await _db.MissingPersons.FindAsync(id);
            if (person != null)
            {
                person.DeletedAt = DateTime.Now;
                person.Status = 4;
                await _db.SaveChangesAsync();
                TempData["Success"] = $"Đã xoá bài đăng \"{person.FullName}\".";
            }
            return RedirectToAction("MissingPersons");
        }

        // POST: /Admin/ResolveMissingPerson/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResolveMissingPerson(int id)
        {
            var person = await _db.MissingPersons.FindAsync(id);
            if (person != null)
            {
                person.Status = 2;
                await _db.SaveChangesAsync();
                TempData["Success"] = $"Đã đánh dấu \"{person.FullName}\" là đã tìm thấy.";
            }
            return RedirectToAction("MissingPersons");
        }

        // ─── QUẢN LÝ BÁO CÁO ────────────────────────────────────────────────────

        // GET: /Admin/PostPreview/5 — trả JSON để modal AJAX hiển thị
        [HttpGet]
        public async Task<IActionResult> PostPreview(int id)
        {
            var mp = await _db.MissingPersons
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (mp == null)
                return Json(new { found = false });

            // Parse packed description: TUOI:|GIOITINH:|CHIEUCAO:|DACBIET:|LIENHE:|NOIDUNG:
            string GetDesc(string key) {
                if (string.IsNullOrEmpty(mp.Description)) return "";
                foreach (var p in mp.Description.Split('|'))
                    if (p.StartsWith(key + ":")) return p.Substring(key.Length + 1);
                return "";
            }

            var clues = await _db.Clues
                .Include(c => c.User)
                .Where(c => c.MissingPersonId == id)
                .OrderByDescending(c => c.CreatedAt)
                .Take(5)
                .ToListAsync();

            var clueList = clues.Select(c => new {
                reporter   = c.User?.FullName ?? "Ẩn danh",
                content    = c.Description,
                location   = c.Location,
                imageUrl   = c.ImageUrl,
                createdAt  = c.CreatedAt.ToString("dd/MM/yyyy HH:mm")
            }).ToList();

            string statusLabel = mp.Status switch {
                1 => "Đang tìm kiếm",
                2 => "Đã tìm thấy",
                3 => "Đã đóng",
                4 => "Đã bị xoá",
                _ => "Không rõ"
            };

            return Json(new {
                found            = true,
                id               = mp.Id,
                fullName         = mp.FullName,
                imageUrl         = mp.ImageUrl,
                status           = statusLabel,
                statusCode       = mp.Status,
                createdAt        = mp.CreatedAt.ToString("HH:mm dd/MM/yyyy"),
                lastSeenLocation = mp.LastSeenLocation,
                ownerName        = mp.User?.FullName ?? "Không rõ",
                ownerEmail       = mp.User?.Email ?? "",
                isDeleted        = mp.DeletedAt != null,
                // Các trường parsed từ Description
                age              = GetDesc("TUOI"),
                gender           = GetDesc("GIOITINH"),
                height           = GetDesc("CHIEUCAO"),
                feature          = GetDesc("DACBIET"),
                contact          = GetDesc("LIENHE"),
                noteContent      = GetDesc("NOIDUNG"),
                clueCount        = clues.Count,
                clues            = clueList
            });
        }


        [HttpGet]
        public async Task<IActionResult> Reports(string? search, int? status, int page = 1)
        {
            int pageSize = 10;
            var (items, totalCount) = await _reportService.GetAllReportsAsync(search, status, page, pageSize);

            ViewBag.TotalCount = totalCount;
            ViewBag.Page       = page;
            ViewBag.PageSize   = pageSize;
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalCount / pageSize);
            ViewBag.Search     = search ?? "";
            ViewBag.Status     = status?.ToString() ?? "";

            return View(items);
        }

        // POST: /Admin/ResolveReport
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResolveReport(int id)
        {
            await _reportService.ResolveAndDeleteAsync(id);
            TempData["Success"] = "Đã xử lý báo cáo: bài đăng đã được gỡ xuống và chủ bài đã được thông báo.";
            return RedirectToAction("Reports");
        }

        // POST: /Admin/DismissReport
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DismissReport(int id)
        {
            await _reportService.DismissReportAsync(id);
            TempData["Info"] = "Đã bỏ qua báo cáo này.";
            return RedirectToAction("Reports");
        }

        // POST: /Admin/Logout
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            Response.Cookies.Delete("jwtToken");
            return RedirectToAction("Login", "Auth");
        }
    }
}
