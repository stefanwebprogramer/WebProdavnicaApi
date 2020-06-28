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
    public class EfGetKategorijaQuery : IGetKategorijaQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetKategorijaQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Naziv => "Dohvatanje kategorije";

        public KategorijaDto Izvrsi(int search)
        {

            var query = _context.Kategorije.Where(x => x.Id == search).FirstOrDefault();

            if (query == null)
            {
                throw new EntityNotFoundException(search, typeof(Kategorija));
            }

            var kategorija = new KategorijaDto
            {
                Id = query.Id,
                Naziv = query.Naziv,
                ModifiedAt = query.ModifiedAt
            };

            return kategorija;
        }
    }
}
