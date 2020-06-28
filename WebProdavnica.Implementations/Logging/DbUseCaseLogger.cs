using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Logging
{
    public class DbUseCaseLogger : IUseCaseLogger
    {
        private readonly WebProdavnicaContext _context;

        public DbUseCaseLogger(WebProdavnicaContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new Domain.UseCaseLog
            {
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(useCaseData),
                Datum = DateTime.UtcNow,
                UseCaseNaziv = useCase.Naziv
            });

            _context.SaveChanges();
        }
    }
}
