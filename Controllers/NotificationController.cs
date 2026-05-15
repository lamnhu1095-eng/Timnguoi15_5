using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using DaNangSafeMap.Services.Implementations;

namespace DaNangSafeMap.Controllers
{
    [Authorize]
    public class NotificationController : Controller
    {
        private readonly NotificationService _notif;
        public NotificationController(NotificationService notif) => _notif = notif;

        private int? GetUserId()
        {
            var claim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            return string.IsNullOrEmpty(claim) ? null : int.Parse(claim);
        }

        [HttpGet("Notification/GetRecent")]
        public async Task<IActionResult> GetRecent()
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();

            var list = await _notif.GetRecentAsync(uid.Value);
            return Json(list.Select(n => new {
                n.Id, n.Type, n.Title, n.Message, n.Link, n.IsRead,
                n.CreatedAt
            }));
        }

        [HttpGet("Notification/UnreadCount")]
        public async Task<IActionResult> UnreadCount()
        {
            var uid = GetUserId();
            if (uid == null) return Json(new { count = 0 });
            var count = await _notif.GetUnreadCountAsync(uid.Value);
            return Json(new { count });
        }

        [HttpPost("Notification/MarkAsRead/{id}")]
        public async Task<IActionResult> MarkAsRead(int id)
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();
            await _notif.MarkAsReadAsync(id, uid.Value);
            return Json(new { success = true });
        }

        [HttpPost("Notification/MarkAllRead")]
        public async Task<IActionResult> MarkAllRead()
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();
            await _notif.MarkAllReadAsync(uid.Value);
            return Json(new { success = true });
        }
    }
}
