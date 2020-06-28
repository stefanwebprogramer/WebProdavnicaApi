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
    public class EfCreateGroupCommand : ICreateGroupCommand
    {
        private readonly WebProdavnicaContext _context;

        private readonly CreateGroupValidator _validator;

        public EfCreateGroupCommand(WebProdavnicaContext context, CreateGroupValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 1;

        public string Naziv => "Kreiranje grupe";

        public void Izvrsi(GrupaDto request)
        {
            _validator.ValidateAndThrow(request);
            var grupa = new Grupa
            {
                Naziv = request.Naziv
            };

            _context.Grupe.Add(grupa);

            _context.SaveChanges();
        }
    }
}
