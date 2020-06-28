using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Queries;
using WebProdavnica.Application.Searches;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Queries
{
    public class EfGetPorudzbineQuery : IGetPorudzbineQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetPorudzbineQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 21;

        public string Naziv => "Pretrazivanje porudzbina";

        public PagedResponse<PorudzbinaDto> Izvrsi(PorudzbinaSearch search)
        {
            var query = _context.Porudzbine
                        .Include(x => x.Korisnik)
                        .Include(x => x.StavkaPorudzbine).AsQueryable();

            if (!string.IsNullOrEmpty(search.Adresa) || !string.IsNullOrWhiteSpace(search.Adresa))
            {
                query = query.Where(x => x.Adresa.ToLower().Contains(search.Adresa.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<PorudzbinaDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new PorudzbinaDto
                {
                    Adresa = x.Adresa,
                    VremePorudzbine = x.VremePorudzbine,
                    StavkePorudzbine = x.StavkaPorudzbine.Select(sp=> new DohvatiStavkuPorudzbineDto
                    { 
                        Id = sp.Id,
                        Naziv = sp.Naziv,
                        Kolicina = sp.Kolicina,
                        Cena = sp.Cena
                    })

                }).ToList()
            };

            return response;
        }
    }
}
