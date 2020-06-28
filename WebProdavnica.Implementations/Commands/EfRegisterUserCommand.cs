using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Email;
using WebProdavnica.DataAccess;
using WebProdavnica.Implementations.Validators;

namespace WebProdavnica.Implementations.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly RegisterUserValidator _validator;
        public readonly IEmailSender _sender;

        public EfRegisterUserCommand(WebProdavnicaContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 4;

        public string Naziv => "Registracija novog korisnika";

        public void Izvrsi(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Korisnici.Add(new Domain.Korisnik
            {
                Ime = request.Ime,
                Prezime = request.Prezime,
                KorisnickoIme = request.KorisnickoIme,
                Lozinka = request.Lozinka,
                Email = request.Email,
                GrupaId = request.GrupaId
            });

            _context.SaveChanges();

            _sender.Send(new PosaljiEmailDto
            {
                Sadrzaj = "Uspesna registracija",
                Kome = request.Email,
                Naslov = "Api registracija"
            });
        }
    }
}
