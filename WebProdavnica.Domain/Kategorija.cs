using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class Kategorija : Entity
    {
        public string Naziv { get; set; }
        public virtual ICollection<Proizvod> Proizvodi { get; set; }
    }
}
