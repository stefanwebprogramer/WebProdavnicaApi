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
    public class EfGetGroupQuery : IGetGroupQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetGroupQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 5;

        public string Naziv => "Dohvatanje grupe po id-u";

        public GrupaDto Izvrsi(int search)
        {
            var query = _context.Grupe.Where(x=>x.Id==search).FirstOrDefault();

            if (query == null) {
                throw new EntityNotFoundException(search, typeof(Grupa));
            }
            
            var group = new GrupaDto
            {
                Id = query.Id,
                Naziv = query.Naziv,
                ModifiedAt = query.ModifiedAt
            };

            return group;
        }
    }
}
