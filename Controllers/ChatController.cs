using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using DaNangSafeMap.Services.Implementations;

namespace DaNangSafeMap.Controllers
{
    public class ChatController : Controller
    {
        private readonly MpChatService _chat;
        public ChatController(MpChatService chat) => _chat = chat;

        [HttpPost("Chat/OpenRoom")]
        public async Task<IActionResult> OpenRoom([FromBody] OpenRoomRequest req)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim))
                return Unauthorized(new { error = "Cần đăng nhập để chat" });

            int senderId = int.Parse(userIdClaim);
            var room = await _chat.GetOrCreateRoomAsync(req.MissingPersonId, senderId);
            return Json(new { roomId = room.Id, roomName = room.Name });
        }

        [HttpGet("Chat/Messages/{roomId}")]
        public async Task<IActionResult> GetMessages(int roomId)
        {
            var msgs = await _chat.GetMessagesAsync(roomId);
            var result = msgs.Select(m => new {
                m.Id,
                m.SenderId,
                SenderName = m.Sender?.FullName ?? "Ẩn danh",
                m.Message,
                SentAt = m.SentAt.ToString("HH:mm dd/MM"),
                m.IsRead
            });
            return Json(result);
        }

        [HttpPost("Chat/Send")]
        public async Task<IActionResult> Send([FromBody] SendMessageRequest req)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim))
                return Unauthorized(new { error = "Cần đăng nhập để gửi tin" });

            int senderId = int.Parse(userIdClaim);
            var msg = await _chat.SendMessageAsync(req.RoomId, senderId, req.Message);
            return Json(new { success = true, msgId = msg.Id });
        }

        [HttpPost("Chat/MarkRead/{roomId}")]
        public async Task<IActionResult> MarkRead(int roomId)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim)) return Unauthorized();
            int userId = int.Parse(userIdClaim);
            await _chat.MarkReadAsync(roomId, userId);
            return Json(new { success = true });
        }

        [HttpGet("Chat/CheckUnread")]
        public async Task<IActionResult> CheckUnread([FromQuery] string missingPersonIds)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim)) return Json(new { count = 0 });

            int ownerId = int.Parse(userIdClaim);
            var ids = (missingPersonIds ?? "").Split(',')
                .Select(s => int.TryParse(s.Trim(), out var n) ? n : -1)
                .Where(n => n > 0).ToList();

            int count = await _chat.CountUnreadForOwnerAsync(ownerId, ids);
            return Json(new { count });
        }

        [HttpGet("Chat/Rooms/{missingPersonId}")]
        public async Task<IActionResult> GetRooms(int missingPersonId)
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            int? currentUserId = string.IsNullOrEmpty(userIdClaim) ? null : int.Parse(userIdClaim);

            var rooms = await _chat.GetRoomsByMissingPersonAsync(missingPersonId);
            var result = new List<object>();
            foreach (var r in rooms)
            {
                int unread = currentUserId.HasValue
                    ? await _chat.CountUnreadInRoomAsync(r.Id, currentUserId.Value)
                    : 0;
                result.Add(new { r.Id, r.Name, r.CreatedAt, UnreadCount = unread });
            }
            return Json(result);
        }
    }

    public class OpenRoomRequest  { public int MissingPersonId { get; set; } }
    public class SendMessageRequest { public int RoomId { get; set; } public string Message { get; set; } = ""; }
}
