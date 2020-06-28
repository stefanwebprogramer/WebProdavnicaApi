using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebProdavnica.Application.DataTransfer
{
    public class PorudzbinaDto
    {
        public DateTime VremePorudzbine { get; set; }
        public string Adresa { get; set; }
        public IEnumerable<DohvatiStavkuPorudzbineDto> StavkePorudzbine { get; set; } = new List<DohvatiStavkuPorudzbineDto>();
        public decimal TotalPrice => StavkePorudzbine.Sum(x => x.Cena * x.Kolicina);
    }

    public class DohvatiStavkuPorudzbineDto
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public decimal Kolicina { get; set; }
        public decimal Cena { get; set; }
    }
}
