using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace WebProdavnica.Domain
{
    public class Korisnik : Entity
    {
        [Required]
        public string KorisnickoIme { get; set; }
        [Required]
        public string Ime { get; set; }
        [Required]
        public string Prezime { get; set; }
        [Required]
        public string Lozinka { get; set; }
        public string Email { get; set; }

        public virtual ICollection<KorisnikUseCase> KorisnikUseCases { get; set; } = new HashSet<KorisnikUseCase>();
        public int GrupaId { get; set; }

        public virtual Grupa Grupa { get; set; }

        public virtual ICollection<Porudzbina> Porudzbine { get; set; } = new HashSet<Porudzbina>();
    }
}
