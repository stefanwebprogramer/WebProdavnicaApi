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
    public class EfCreateProizvodCommand : ICreateProizvodCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly CreateProizvodValidator _validator;

        public EfCreateProizvodCommand(WebProdavnicaContext context, CreateProizvodValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 17;

        public string Naziv => "Kreiranje proizvoda";

        public void Izvrsi(ProizvodDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Proizvodi.Add(new Proizvod
            {
                Naziv = request.Naziv,
                Cena = request.Cena,
                Opis = request.Opis,
                KategorijaId = request.KategorijaId
            });

            _context.SaveChanges();
        }
    }
}
