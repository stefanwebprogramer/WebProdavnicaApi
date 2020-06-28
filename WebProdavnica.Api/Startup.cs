using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using WebProdavnica.Api.Core;
using WebProdavnica.Application;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.Email;
using WebProdavnica.Application.Queries;
using WebProdavnica.DataAccess;
using WebProdavnica.Implementations.Commands;
using WebProdavnica.Implementations.Email;
using WebProdavnica.Implementations.Logging;
using WebProdavnica.Implementations.Queries;
using WebProdavnica.Implementations.Validators;

namespace WebProdavnica.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<WebProdavnicaContext>();

            services.AddTransient<ICreateGroupCommand, EfCreateGroupCommand>();
            services.AddTransient<ICreatePorudzbinuCommand, EfNapraviPorudzbinuCommand>();
            services.AddTransient<ICreateKategorijaCommand, EfCreateKategorijaCommand>();
            services.AddTransient<ICreateProizvodCommand, EfCreateProizvodCommand>();

            services.AddTransient<IUpdateGroupCommand, EfUpdateGroupCommand>();
            services.AddTransient<IUpdateKategorijuCommand, EfUpdateKategorijaCommand>();
            services.AddTransient<IUpdateKorisnikCommand, EfUpdateKorisnikCommand>();
            services.AddTransient<IUpdateProizvodCommand, EfUpdateProizvodCommand>();

            services.AddTransient<IDeleteGroupCommand, EfDeleteGroupCommand>();
            services.AddTransient<IDeleteKategorijuCommand, EfDeleteKategorijaCommand>();
            services.AddTransient<IDeleteKorisnikCommand, EfDeleteKorisnikCommand>();
            services.AddTransient<IDeleteProizvodCommand, EfDeleteProizvodCommand>();

            services.AddTransient<IGetGroupQuery, EfGetGroupQuery>();
            services.AddTransient<IGetKategorijaQuery, EfGetKategorijaQuery>();
            services.AddTransient<IGetKorisnikQuery, EfGetKorisnikQuery>();
            services.AddTransient<IGetProizvodQuery, EfGetProizvodQuery>();
            services.AddTransient<IGetPorudzbinaQuery, EfGetPorudzbinaQuery>();

            services.AddTransient<IGetGroupsQuery, EfGetGroupsQuery>();
            services.AddTransient<IGetKategorijeQuery, EfGetKategorijeQuery>();
            services.AddTransient<IGetKorisniciQuery, EfGetKorisniciQuery>();
            services.AddTransient<IGetProizvodiQuery, EfGetProizvodiQuery>();
            services.AddTransient<IGetPorudzbineQuery, EfGetPorudzbineQuery>();
            services.AddTransient<IGetUseCaseLogQuery, EfGetUseCaseLogQuery>();


            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();

            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x => {
                var accessor = x.GetService<IHttpContextAccessor>();
                var user = accessor.HttpContext.User;
                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }
                var autorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(autorString);
                return actor;
            });
            services.AddTransient<IUseCaseLogger, DbUseCaseLogger>();
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            services.AddTransient<UseCaseExecutor>();


            services.AddTransient<CreateGroupValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<UpdateGroupValidator>();
            services.AddTransient<NapraviPorudzbinuValidator>();
            services.AddTransient<NapraviStavkuPorudzbineValidator>();
            services.AddTransient<KategorijaValidator>();
            services.AddTransient<CreateProizvodValidator>();
            services.AddTransient<UpdateKorisnikValidator>();
            services.AddTransient<UpdateProizvodValidator>();
            services.AddTransient<UpdateKategorijuValidator>();

            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });

            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();
            app.UseStaticFiles();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
