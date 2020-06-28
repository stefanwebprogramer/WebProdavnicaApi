using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class Proizvod : Entity
    {
        public string Naziv { get; set; }
        public decimal Cena { get; set; }
        public string Opis { get; set; }
        public string? Slika { get; set; }
        public int Kolicina { get; set; }

        public int KategorijaId { get; set; }

        public virtual Kategorija Kategorija { get; set; }
        public virtual ICollection<StavkaPorudzbine> StavkaPorudzbines { get; set; } = new HashSet<StavkaPorudzbine>();
    }
}
