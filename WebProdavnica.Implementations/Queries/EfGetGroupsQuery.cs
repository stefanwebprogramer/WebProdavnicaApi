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
    public class EfGetGroupsQuery : IGetGroupsQuery
    {
        private readonly WebProdavnicaContext context;

        public EfGetGroupsQuery(WebProdavnicaContext context)
        {
            this.context = context;
        }

        public int Id => 3;

        public string Naziv => "Pretraga grupa";

        public PagedResponse<GrupaDto> Izvrsi(GroupSearch search)
        {
            var query = context.Grupe.AsQueryable();

            if (!string.IsNullOrEmpty(search.Naziv) || !string.IsNullOrWhiteSpace(search.Naziv)) 
            {
                query = query.Where(x => x.Naziv.ToLower().Contains(search.Naziv.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<GrupaDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new GrupaDto {
                    Id = x.Id,
                    Naziv = x.Naziv
                }).ToList()
            };

            return response;
        }
    }
}
