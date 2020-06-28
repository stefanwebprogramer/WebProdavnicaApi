using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.Application.DataTransfer
{
    public class NapraviPorudzbinuDto
    {
        public DateTime VremePorudzbine { get; set; }
        public string Adresa { get; set; }
        public IEnumerable<NapraviStavkuPorudzbineDto> StavkePorudzbine { get; set; } = new List<NapraviStavkuPorudzbineDto>();
    }

    public class NapraviStavkuPorudzbineDto
    { 
        public int ProizvodId { get; set; }
        public int Kolicina { get; set; }
        public string Naziv { get; set; }
        public int Cena { get; set; }
    }
}
