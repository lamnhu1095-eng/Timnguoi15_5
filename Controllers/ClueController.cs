using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using DaNangSafeMap.Services.Implementations;

namespace DaNangSafeMap.Controllers
{
    public class ClueController : Controller
    {
        private readonly ClueService _clueService;
        private readonly IWebHostEnvironment _env;

        public ClueController(ClueService clueService, IWebHostEnvironment env)
        {
            _clueService = clueService;
            _env = env;
        }

        [HttpGet("Clue/GetClues/{missingPersonId}")]
        public async Task<IActionResult> GetClues(int missingPersonId)
        {
            var clues = await _clueService.GetByMissingPersonAsync(missingPersonId);
            var result = clues.Select(c => new {
                c.Id,
                c.Location,
                c.ImageUrl,
                c.CreatedAt,
                SeenAt    = ClueService.GetField(c.Description, "SEEN_AT"),
                Phone     = ClueService.GetField(c.Description, "PHONE"),
                Content   = ClueService.GetField(c.Description, "CONTENT"),
                SenderName = c.User?.FullName ?? "Ẩn danh"
            });
            return Json(result);
        }

        [HttpPost("Clue/Submit")]
        public async Task<IActionResult> Submit([FromForm] ClueSubmitRequest req)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            if (req.SeenAt > DateTime.Now)
                return BadRequest(new { error = "Thời gian thấy phải ở quá khứ" });

            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            int? userId = string.IsNullOrEmpty(userIdClaim) ? null : int.Parse(userIdClaim);

            string? imageUrl = null;
            if (req.Photo != null && req.Photo.Length > 0)
            {
                var folder = Path.Combine(_env.WebRootPath, "images", "clues");
                Directory.CreateDirectory(folder);
                var ext = Path.GetExtension(req.Photo.FileName);
                var fname = $"{Guid.NewGuid()}{ext}";
                using var fs = new FileStream(Path.Combine(folder, fname), FileMode.Create);
                await req.Photo.CopyToAsync(fs);
                imageUrl = $"/images/clues/{fname}";
            }

            int? finalUserId = req.IsAnonymous ? null : userId;

            var clue = await _clueService.CreateAsync(
                req.MissingPersonId, finalUserId,
                req.SeenLocation, req.SeenAt, req.Content,
                req.Phone, imageUrl);

            return Json(new { success = true, clueId = clue.Id });
        }
    }

    public class ClueSubmitRequest
    {
        public int MissingPersonId { get; set; }
        public string SeenLocation { get; set; } = "";
        public DateTime SeenAt { get; set; }
        public string Content { get; set; } = "";
        public string? Phone { get; set; }
        public IFormFile? Photo { get; set; }
        public bool IsAnonymous { get; set; } = false;
    }
}
