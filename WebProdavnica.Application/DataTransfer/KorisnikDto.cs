using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.Application.DataTransfer
{
    public class KorisnikDto
    {
        public int Id { get; set; }
        public string KorisnickoIme { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Email { get; set; }
        public int GrupaId { get; set; }
        public string Lozinka { get; set; }
        public IEnumerable<KorisnikUseCaseDto> KorisnikUseCase { get; set; } = new List<KorisnikUseCaseDto>();
    }

    public class KorisnikUseCaseDto
    { 
        public int Id { get; set; }
        public int Usecase { get; set; }
    
    }
}
