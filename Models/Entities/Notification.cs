using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DaNangSafeMap.Models.Entities
{
    [Table("notifications")]
    public class Notification
    {
        [Key]
        public int Id { get; set; }

        public int UserId { get; set; }          // Người nhận thông báo

        [MaxLength(20)]
        public string Type { get; set; } = "";   // "clue" | "chat"

        [MaxLength(200)]
        public string Title { get; set; } = "";

        [MaxLength(500)]
        public string Message { get; set; } = "";

        [MaxLength(500)]
        public string? Link { get; set; }        // Đường dẫn khi click vào

        public bool IsRead { get; set; } = false;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [ForeignKey("UserId")]
        public User? User { get; set; }
    }
}
