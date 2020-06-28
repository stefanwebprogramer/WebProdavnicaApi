using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class Porudzbina : Entity
    {
        public DateTime VremePorudzbine { get; set; }
        public int KorisnikId { get; set; }
        public StatusPorudzbine status { get; set; }
        public virtual ICollection<StavkaPorudzbine>  StavkaPorudzbine { set; get; } = new HashSet<StavkaPorudzbine>();
        public virtual Korisnik Korisnik { get; set; }

        public string Adresa { get; set; }
    }
    public enum StatusPorudzbine
    { 
        Primljena,
        Isporucena,
        Poslata,
        Otkazana
    }
}
