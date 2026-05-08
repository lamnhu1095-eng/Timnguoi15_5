using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using DaNangSafeMap.Services.Implementations;

namespace DaNangSafeMap.Controllers.Api
{
    [ApiController]
    [Route("api/notifications")]
    [Authorize]
    public class NotificationApiController : ControllerBase
    {
        private readonly NotificationService _notif;
        public NotificationApiController(NotificationService notif) => _notif = notif;

        private int? GetUserId()
        {
            var claim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            return string.IsNullOrEmpty(claim) ? null : int.Parse(claim);
        }

        // GET /api/notifications — lấy danh sách gần đây
        [HttpGet]
        public async Task<IActionResult> GetRecent()
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();

            var list = await _notif.GetRecentAsync(uid.Value);
            return Ok(list.Select(n => new {
                n.Id, n.Type, n.Title, n.Message, n.Link, n.IsRead,
                n.CreatedAt
            }));
        }

        // GET /api/notifications/unread-count — đếm chưa đọc
        [HttpGet("unread-count")]
        public async Task<IActionResult> UnreadCount()
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();
            return Ok(new { count = await _notif.CountUnreadAsync(uid.Value) });
        }

        // POST /api/notifications/read/{id}
        [HttpPost("read/{id:int}")]
        public async Task<IActionResult> MarkRead(int id)
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();
            await _notif.MarkReadAsync(id, uid.Value);
            return Ok();
        }

        // POST /api/notifications/readall
        [HttpPost("readall")]
        public async Task<IActionResult> MarkAllRead()
        {
            var uid = GetUserId();
            if (uid == null) return Unauthorized();
            await _notif.MarkAllReadAsync(uid.Value);
            return Ok();
        }
    }
}
