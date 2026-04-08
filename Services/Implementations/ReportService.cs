using DaNangSafeMap.Data;
using DaNangSafeMap.Models.DTOs;
using DaNangSafeMap.Models.Entities;
using DaNangSafeMap.Services.Interfaces;
using System;
using System.Threading.Tasks;

namespace DaNangSafeMap.Services.Implementations
{
    public class ReportService : IReportService
    {
        private readonly ApplicationDbContext _db;

        public ReportService(ApplicationDbContext db)
        {
            _db = db;
        }

        public async Task<Report> CreateReportAsync(ReportDto dto, int? reporterId)
        {
            try
            {
                // Đảm bảo bảng reports tồn tại và các cột đúng định dạng (có thể null)
                Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, @"
                    CREATE TABLE IF NOT EXISTS `reports` (
                      `Id` int NOT NULL AUTO_INCREMENT,
                      `ReporterId` int DEFAULT NULL,
                      `TargetId` int NOT NULL,
                      `TargetType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                      `Reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
                      `Details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                      `Status` int DEFAULT '1',
                      `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
                      PRIMARY KEY (`Id`)
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
                ");
                try { Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, "ALTER TABLE `reports` DROP FOREIGN KEY `FK_Report_User`;"); } catch { }
                try { Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, "ALTER TABLE `reports` MODIFY COLUMN `ReporterId` int NULL;"); } catch { }
                try { Microsoft.EntityFrameworkCore.RelationalDatabaseFacadeExtensions.ExecuteSqlRaw(_db.Database, "ALTER TABLE `reports` ADD COLUMN `Details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL;"); } catch { }
            }
            catch { }

            var report = new Report
            {
                ReporterId = reporterId,
                TargetId = dto.TargetId,
                TargetType = dto.TargetType,
                Reason = dto.Reason,
                Details = dto.Details,
                Status = 1, // Pending
                CreatedAt = DateTime.UtcNow
            };

            _db.Reports.Add(report);
            await _db.SaveChangesAsync();

            return report;
        }
    }
}
