using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.DataTransfer
{
    public class RegisterUserDto
    {

        public int Id { get; set; }
        public string KorisnickoIme { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Lozinka { get; set; }
        public string Email { get; set; }
        public int GrupaId { get; set; }
        public DateTime CreatedAd { get; set; }
        public DateTime? ModifiedAt { get; set; }
        public DateTime? DeletedAd { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
    }
}
