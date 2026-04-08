using DaNangSafeMap.Models.DTOs;
using DaNangSafeMap.Models.Entities;
using System.Threading.Tasks;

namespace DaNangSafeMap.Services.Interfaces
{
    public interface IReportService
    {
        Task<Report> CreateReportAsync(ReportDto dto, int? reporterId);
    }
}
