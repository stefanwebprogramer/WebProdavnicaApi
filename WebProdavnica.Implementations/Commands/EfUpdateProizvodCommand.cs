using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.DataAccess;
using WebProdavnica.Domain;
using WebProdavnica.Implementations.Validators;

namespace WebProdavnica.Implementations.Commands
{
    public class EfUpdateProizvodCommand : IUpdateProizvodCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly UpdateProizvodValidator _validator;

        public EfUpdateProizvodCommand(WebProdavnicaContext context, UpdateProizvodValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 18;

        public string Naziv => "Update proizvoda";

        public void Izvrsi(ProizvodDto dto)
        {
            _validator.ValidateAndThrow(dto);
            var proizvod = _context.Proizvodi.Find(dto.Id);

            if (proizvod == null)
            {
                throw new EntityNotFoundException(dto.Id, typeof(Proizvod));
            }
            proizvod.Naziv = dto.Naziv;
            proizvod.Cena = dto.Cena;
            proizvod.Opis = dto.Opis;
            proizvod.Kolicina = dto.Kolicina;


            try
            {
                _context.SaveChanges();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
