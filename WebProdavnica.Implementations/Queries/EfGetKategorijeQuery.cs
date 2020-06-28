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
    public class EfGetKategorijeQuery : IGetKategorijeQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetKategorijeQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Naziv => "Dohvatanje Kategorija";

        public PagedResponse<KategorijaDto> Izvrsi(KategorijaSearch search)
        {

            var query = _context.Kategorije.AsQueryable();

            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                query = query.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<KategorijaDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new KategorijaDto
                {
                    Id = x.Id,
                    Naziv = x.Naziv
                }).ToList()
            };

            return response;
        }
    }
}
