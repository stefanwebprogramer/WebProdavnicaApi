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
    public class EfGetKorisniciQuery : IGetKorisniciQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetKorisniciQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 12;

        public string Naziv => "Prikaz svih korisnika";

        public PagedResponse<KorisnikDto> Izvrsi(KorisnikSearch search)
        {
            var query = _context.Korisnici.AsQueryable();

            if (!string.IsNullOrEmpty(search.Ime) || !string.IsNullOrWhiteSpace(search.Ime))
            {
                query = query.Where(x => x.Ime.ToLower().Contains(search.Ime.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<KorisnikDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new KorisnikDto
                {
                    Id = x.Id,
                    KorisnickoIme = x.KorisnickoIme,
                    Ime = x.Ime,
                    Prezime = x.Prezime,
                    Email = x.Email,
                    Lozinka = x.Lozinka,
                    GrupaId = x.GrupaId
                }).ToList()
            };

            return response;
        }
    }
}
