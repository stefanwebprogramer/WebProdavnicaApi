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
    public class EfGetKorisnikQuery : IGetKorisnikQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetKorisnikQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 13;

        public string Naziv => "Dohvatanje korisnika po id-u";

        public KorisnikDto Izvrsi(int search)
        {
            var query = _context.Korisnici.Where(x => x.Id == search).FirstOrDefault();

            if (query == null)
            {
                throw new EntityNotFoundException(search, typeof(Korisnik));
            }

            var korisnik = new KorisnikDto
            {
                Id = query.Id,
                KorisnickoIme = query.KorisnickoIme,
                Ime = query.Ime,
                Prezime = query.Prezime,
                Email = query.Email,
                Lozinka = query.Lozinka,
                GrupaId = query.GrupaId
            };

            return korisnik;
        }
    }
}
