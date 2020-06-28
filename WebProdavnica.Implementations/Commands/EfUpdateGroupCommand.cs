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
    public class EfUpdateGroupCommand : IUpdateGroupCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly UpdateGroupValidator _validator;

        public EfUpdateGroupCommand(WebProdavnicaContext context, UpdateGroupValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 6;

        public string Naziv => "Update Grupe";

        public void Izvrsi(GrupaDto dto)
        {
            _validator.ValidateAndThrow(dto);
            var grupa = _context.Grupe.Find(dto.Id);

            if (grupa == null)
            {
                throw new EntityNotFoundException(dto.Id, typeof(Grupa));
            }

            grupa.Naziv = dto.Naziv;

            try
            {
                _context.SaveChanges();
            }
            catch (Exception e) {
                throw e;
            }
        }
    }
}
