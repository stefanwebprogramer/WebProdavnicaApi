using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebProdavnica.Application;

namespace WebProdavnica.Api.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymus";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 1000);
    }
}
