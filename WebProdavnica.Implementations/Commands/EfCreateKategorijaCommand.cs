using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;
using WebProdavnica.Implementations.Validators;

namespace WebProdavnica.Implementations.Commands
{
    public class EfCreateKategorijaCommand : ICreateKategorijaCommand
    {
        private readonly WebProdavnicaContext _context;

        private readonly KategorijaValidator _validator;

        public EfCreateKategorijaCommand(WebProdavnicaContext context, KategorijaValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 8;

        public string Naziv => "Kreiranje kategorije";

        public void Izvrsi(KategorijaDto request)
        {
            _validator.ValidateAndThrow(request);
            var kategorija = new Kategorija
            {
                Naziv = request.Naziv
            };

            _context.Kategorije.Add(kategorija);

            _context.SaveChanges();
        }
    }
}
