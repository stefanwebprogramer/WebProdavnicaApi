using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application;

namespace WebProdavnica.Implementations.Logging
{
    public class ConsoleUseCaseLogger : IUseCaseLogger
    {
        public void Log(IUseCase useCase, IApplicationActor actor, object data)
        {
            Console.WriteLine($"{DateTime.Now}: {actor.Identity} pokusava da izvrsi {useCase.Naziv} sa podacima: {JsonConvert.SerializeObject(data)}" );
        }
    }
}
