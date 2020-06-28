using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Queries;
using WebProdavnica.Application.Searches;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Queries
{
    public class EfGetProizvodiQuery : IGetProizvodiQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetProizvodiQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 16;

        public string Naziv => "Prikaz svih proizvoda";

        public PagedResponse<ProizvodDto> Izvrsi(ProizvodSearch search)
        {
            var query = _context.Proizvodi.AsQueryable();

            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                query = query.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<ProizvodDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new ProizvodDto
                {
                    Id = x.Id,
                    Naziv = x.Naziv,
                    Cena = x.Cena,
                    Opis = x.Opis,
                    Slika = x.Slika,
                    Kolicina = x.Kolicina,
                    KategorijaId = x.KategorijaId

                }).ToList()
            };

            return response;
        }
    }
}
