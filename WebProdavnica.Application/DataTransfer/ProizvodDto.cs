using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.DataTransfer
{
    public class ProizvodDto
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public decimal Cena { get; set; }
        public string Opis { get; set; }
        public string? Slika { get; set; }
        public int Kolicina { get; set; }
        public int KategorijaId { get; set; }
    }
}
