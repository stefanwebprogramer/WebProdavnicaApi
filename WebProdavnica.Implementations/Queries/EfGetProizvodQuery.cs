using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.Application.Queries;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Queries
{
    public class EfGetProizvodQuery : IGetProizvodQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetProizvodQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Naziv => "Dohvatanje proizvoda po idu";

        public ProizvodDto Izvrsi(int search)
        {
            var query = _context.Proizvodi.Where(x => x.Id == search).FirstOrDefault();

            if (query == null)
            {
                throw new EntityNotFoundException(search, typeof(Proizvod));
            }

            var proizvod = new ProizvodDto
            {
                Id = query.Id,
                Naziv = query.Naziv,
                Cena = query.Cena,
                Opis = query.Opis,
                Slika = query.Slika,
                Kolicina = query.Kolicina,
                KategorijaId = query.KategorijaId
            };

            return proizvod;
        }
    }
}
