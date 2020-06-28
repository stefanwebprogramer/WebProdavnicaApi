using Microsoft.EntityFrameworkCore;
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
    public class EfGetPorudzbinaQuery : IGetPorudzbinaQuery
    {
        private readonly WebProdavnicaContext _context;

        public EfGetPorudzbinaQuery(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Naziv => "Dohvatanje porudzbine po idu";

        public PorudzbinaDto Izvrsi(int search)
        {

            var query = _context.Porudzbine
                         .Include(x => x.Korisnik)
                         .Include(x => x.StavkaPorudzbine).FirstOrDefault();

            if (query == null)
            {
                throw new EntityNotFoundException(search, typeof(Porudzbina));
            }

            var korisnik = new PorudzbinaDto
            {
                Adresa = query.Adresa,
                VremePorudzbine = query.VremePorudzbine,
                StavkePorudzbine = query.StavkaPorudzbine.Select(sp => new DohvatiStavkuPorudzbineDto
                {
                    Id = sp.Id,
                    Naziv = sp.Naziv,
                    Kolicina = sp.Kolicina,
                    Cena = sp.Cena
                })
            };

            return korisnik;
        }
    }
}
