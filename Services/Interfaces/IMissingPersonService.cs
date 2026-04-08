using DaNangSafeMap.Models.Entities;
using DaNangSafeMap.Models.ViewModels.MissingPerson;

namespace DaNangSafeMap.Services.Interfaces
{
    public interface IMissingPersonService
    {
        Task<List<MissingPerson>> GetAllActiveAsync();
        Task<MissingPerson?> GetByIdAsync(int id);
        Task<MissingPerson> CreateAsync(CreateMissingPersonViewModel model, int userId, string imageUrl);
        Task<bool> DeleteAsync(int id, int userId);
    }
}
