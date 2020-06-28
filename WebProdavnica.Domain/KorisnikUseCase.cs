using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Domain
{
    public class KorisnikUseCase
    {
        public int Id { get; set; }
        public int KorisnikId { get; set; }
        public int UseCaseId { get; set; }

        public virtual Korisnik Korisnik { get; set; }
    }
}
