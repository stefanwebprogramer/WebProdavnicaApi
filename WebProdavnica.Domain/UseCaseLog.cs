using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class UseCaseLog
    {
        public int Id { get; set; }
        public DateTime Datum { get; set; }
        public string UseCaseNaziv { get; set; }
        public string Data { get; set; }
        public string Actor { get; set; }
    }
}
