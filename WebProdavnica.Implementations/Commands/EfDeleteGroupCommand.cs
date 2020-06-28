using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Commands
{
    public class EfDeleteGroupCommand : IDeleteGroupCommand
    {
        private readonly WebProdavnicaContext _context;

        public EfDeleteGroupCommand(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Naziv => "Brisanje grupe";

        public void Izvrsi(int request)
        {
           var grupa = _context.Grupe.Find(request);

            if (grupa == null) {
                throw new EntityNotFoundException(request, typeof(Grupa));
            }

            _context.Remove(grupa);

            _context.SaveChanges();
        }
    }
}
