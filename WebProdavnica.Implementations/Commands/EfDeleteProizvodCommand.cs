using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Commands
{
    public class EfDeleteProizvodCommand : IDeleteProizvodCommand
    {
        private readonly WebProdavnicaContext _context;

        public EfDeleteProizvodCommand(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Naziv => "Brisanje proizvoda";

        public void Izvrsi(int request)
        {
            var proizvod = _context.Proizvodi.Find(request);

            if (proizvod == null)
            {
                throw new EntityNotFoundException(request, typeof(Proizvod));
            }

            _context.Remove(proizvod);

            _context.SaveChanges();
        }
    }
}
