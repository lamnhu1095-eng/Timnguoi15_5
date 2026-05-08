using Microsoft.EntityFrameworkCore;
using DaNangSafeMap.Models.Entities;

namespace DaNangSafeMap.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; } = null!;
        public DbSet<MissingPerson> MissingPersons { get; set; } = null!;
        public DbSet<Clue> Clues { get; set; } = null!;                 // bảng clues
        public DbSet<ChatRoom> ChatRooms { get; set; } = null!;         // bảng chatrooms
        public DbSet<ChatMessage> ChatMessages { get; set; } = null!;   // bảng chatmessages
        public DbSet<Report> Reports { get; set; } = null!;             // bảng reports
        public DbSet<Notification> Notifications { get; set; } = null!; // bảng notifications

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<User>(entity =>
            {
                // Unique constraints
                entity.HasIndex(e => e.Email).IsUnique();
                entity.HasIndex(e => e.GoogleId).IsUnique();

                // Default values
                entity.Property(e => e.CreatedAt)
                      .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.Role)
                      .HasDefaultValue("User");

                entity.Property(e => e.AuthProvider)
                      .HasDefaultValue("Local");

                entity.Property(e => e.IsActive)
                      .HasDefaultValue(true);
            });
        }
    }
}
