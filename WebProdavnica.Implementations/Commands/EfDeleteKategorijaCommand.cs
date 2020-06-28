using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;

namespace WebProdavnica.Implementations.Commands
{
    public class EfDeleteKategorijaCommand : IDeleteKategorijuCommand
    {
        private readonly WebProdavnicaContext _context;

        public EfDeleteKategorijaCommand(WebProdavnicaContext context)
        {
            _context = context;
        }

        public int Id => 11;

        public string Naziv => "Brisanje kategorije";

        public void Izvrsi(int request)
        {
            var kategorija = _context.Kategorije.Find(request);

            if (kategorija == null)
            {
                throw new EntityNotFoundException(request, typeof(Kategorija));
            }

            _context.Remove(kategorija);

            _context.SaveChanges();
        }
    }
}
