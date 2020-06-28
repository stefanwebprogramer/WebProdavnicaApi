using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Commands
{
    public class EfDeleteKorisnikCommand : IDeleteKorisnikCommand
    {
        private readonly WebProdavnicaContext _context;

        public EfDeleteKorisnikCommand(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Naziv => "Brisanje korisnika";

        public void Izvrsi(int request)
        {
            var korisnik = _context.Korisnici.Find(request);

            if (korisnik == null)
            {
                throw new EntityNotFoundException(request, typeof(Korisnik));
            }

            _context.Remove(korisnik);

            _context.SaveChanges();
        }
    }
}
