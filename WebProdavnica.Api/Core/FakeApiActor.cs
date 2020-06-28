using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebProdavnica.Application;

namespace WebProdavnica.Api.Core
{
    public class FakeApiActor : IApplicationActor
    {
        public int Id => 1;

        public string Identity => "Test Korisnik";

        public IEnumerable<int> AllowedUseCases => new List<int> { 1 };
    }

    public class AdminApiActor : IApplicationActor
    {

        public int Id => 2;

        public string Identity => "Test Admin";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 1000);
    }
}
