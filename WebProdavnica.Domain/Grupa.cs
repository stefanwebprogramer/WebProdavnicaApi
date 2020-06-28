using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class Grupa : Entity
    {
        public string Naziv { get; set; }
        public virtual ICollection<Korisnik> Korisnici { get; set; }
    }
}
