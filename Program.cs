using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using DaNangSafeMap.Data;
using DaNangSafeMap.Repositories;
using DaNangSafeMap.Services.Implementations;
using DaNangSafeMap.Services.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// ─── 1. KẾT NỐI MYSQL ────────────────────────────────────────────────────────
// Đọc connection string từ appsettings.json và kết nối MySQL
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("DefaultConnection"),
        ServerVersion.AutoDetect(builder.Configuration.GetConnectionString("DefaultConnection"))
    )
);

// ─── 2. JWT AUTHENTICATION ────────────────────────────────────────────────────
// Cấu hình xác thực bằng JWT Bearer token
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!)
        )
    };
    options.Events = new JwtBearerEvents
    {
        OnMessageReceived = context =>
        {
            if (context.Request.Cookies.ContainsKey("jwtToken"))
            {
                context.Token = context.Request.Cookies["jwtToken"];
            }
            return Task.CompletedTask;
        }
    };
});

// ─── 3. ĐĂNG KÝ SERVICES (Dependency Injection) ──────────────────────────────
// Khi controller cần IAuthService, ASP.NET tự inject AuthService vào
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IMissingPersonService, MissingPersonService>();
builder.Services.AddScoped<NotificationService>();              // Hệ thống thông báo
builder.Services.AddScoped<ClueService>();      // Chức năng 3: Manh mối
builder.Services.AddScoped<MpChatService>();    // Chức năng 4: Chatbox
builder.Services.AddScoped<DaNangSafeMap.Services.Interfaces.IReportService, DaNangSafeMap.Services.Implementations.ReportService>(); // Chức năng 6: Báo cáo

// ─── 4. MVC + API ─────────────────────────────────────────────────────────────
builder.Services.AddControllersWithViews();

// Cho phép API trả về JSON
builder.Services.AddEndpointsApiExplorer();

// ─── 5. CORS (cho phép frontend gọi API) ─────────────────────────────────────
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// ─── TỰ TẠO / CẬP NHẬT BẢNG NOTIFICATIONS ───────────────────────────────────
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<DaNangSafeMap.Data.ApplicationDbContext>();

    // Tạo bảng nếu chưa có
    db.Database.ExecuteSqlRaw(@"
        CREATE TABLE IF NOT EXISTS `notifications` (
            `Id`        int          NOT NULL AUTO_INCREMENT,
            `UserId`    int          NOT NULL,
            `Type`      varchar(20)  NOT NULL DEFAULT '',
            `Title`     varchar(200) NOT NULL DEFAULT '',
            `Message`   varchar(500) NOT NULL DEFAULT '',
            `Link`      varchar(500) NULL,
            `IsRead`    tinyint(1)   NOT NULL DEFAULT 0,
            `CreatedAt` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`Id`),
            KEY `IX_notifications_UserId` (`UserId`),
            CONSTRAINT `FK_notifications_Users`
                FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ");

    // Thêm cột Link nếu bảng cũ chưa có (tránh lỗi 'Unknown column')
    try {
        db.Database.ExecuteSqlRaw(@"
            ALTER TABLE `notifications`
            ADD COLUMN `Link` varchar(500) NULL;
        ");
    } catch { /* Cột đã tồn tại → bỏ qua */ }

    // Đồng bộ tên cột: bảng cũ có 'Content' nhưng Entity model dùng 'Message'
    try {
        db.Database.ExecuteSqlRaw(@"
            ALTER TABLE `notifications`
            CHANGE COLUMN `Content` `Message` varchar(500) NOT NULL DEFAULT '';
        ");
    } catch { /* Cột đã đúng tên → bỏ qua */ }

    // Thêm cột Type nếu chưa có
    try {
        db.Database.ExecuteSqlRaw(@"
            ALTER TABLE `notifications`
            ADD COLUMN `Type` varchar(20) NOT NULL DEFAULT '' AFTER `UserId`;
        ");
    } catch { /* Cột đã tồn tại → bỏ qua */ }

}

// ─── MIDDLEWARE PIPELINE ──────────────────────────────────────────────────────
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseCors("AllowAll");

// Thứ tự quan trọng: Authentication trước, Authorization sau
app.UseAuthentication();
app.UseAuthorization();

// Middleware: Chặn Admin không được truy cập trang của người dùng
app.Use(async (context, next) =>
{
    var path = context.Request.Path.Value ?? string.Empty;
    
    if (context.User.Identity != null && context.User.Identity.IsAuthenticated && context.User.IsInRole("Admin"))
    {
        // Cho phép truy cập Admin, API, đăng xuất, và xem chi tiết bài đăng (để review báo cáo)
        if (!path.StartsWith("/Admin", StringComparison.OrdinalIgnoreCase) &&
            !path.StartsWith("/api", StringComparison.OrdinalIgnoreCase) &&
            !path.StartsWith("/Auth", StringComparison.OrdinalIgnoreCase) &&
            !path.StartsWith("/Account/Logout", StringComparison.OrdinalIgnoreCase) &&
            !path.StartsWith("/MissingPerson/Details", StringComparison.OrdinalIgnoreCase))
        {
            context.Response.Redirect("/Admin/Dashboard");
            return;
        }
    }
    await next();
});


// Route cho MVC controllers
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// Route cho API controllers (ApiController attribute)
app.MapControllers();

app.Run();
