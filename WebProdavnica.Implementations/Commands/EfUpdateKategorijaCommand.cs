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
    public class EfUpdateKategorijaCommand : IUpdateKategorijuCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly UpdateKategorijuValidator _validator;

        public EfUpdateKategorijaCommand(WebProdavnicaContext context, UpdateKategorijuValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 10;

        public string Naziv => "Update Kategorije";

        public void Izvrsi(KategorijaDto dto)
        {
            _validator.ValidateAndThrow(dto);
            var kategorija = _context.Kategorije.Find(dto.Id);

            if (kategorija == null)
            {
                throw new EntityNotFoundException(dto.Id, typeof(Kategorija));
            }

            kategorija.Naziv = dto.Naziv;

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
