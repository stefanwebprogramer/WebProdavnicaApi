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
    public class EfGetUseCaseLogQuery : IGetUseCaseLogQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetUseCaseLogQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Naziv => "Dohvatanje UseCase logova";


        public PagedResponse<UseCaseLogDto> Izvrsi(UseCaseLogSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv))
            {
                query = query.Where(x => x.UseCaseNaziv.ToLower().Contains(search.Naziv.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<UseCaseLogDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new UseCaseLogDto
                {
                    Id = x.Id,
                    UseCaseNaziv = x.UseCaseNaziv
                }).ToList()
            };

            return response;
        }

    }
}
