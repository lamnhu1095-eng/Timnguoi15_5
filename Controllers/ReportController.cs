using Microsoft.AspNetCore.Mvc;
using DaNangSafeMap.Models.DTOs;
using DaNangSafeMap.Services.Interfaces;
using System.Security.Claims;

namespace DaNangSafeMap.Controllers
{
    public class ReportController : Controller
    {
        private readonly IReportService _reportService;

        public ReportController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpPost("Report/CreateReport")]
        public async Task<IActionResult> CreateReport([FromBody] ReportDto dto)
        {
            if (dto == null || string.IsNullOrWhiteSpace(dto.Reason))
            {
                return Json(new { error = "Dữ liệu không hợp lệ." });
            }

            int? reporterId = null;
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (int.TryParse(userIdClaim, out int id))
            {
                reporterId = id;
            }

            var report = await _reportService.CreateReportAsync(dto, reporterId);
            return Json(new { success = true, reportId = report.Id });
        }
    }
}
