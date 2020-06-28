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
    public class EfUpdateKorisnikCommand : IUpdateKorisnikCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly UpdateKorisnikValidator _validator;

        public EfUpdateKorisnikCommand(WebProdavnicaContext context, UpdateKorisnikValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 14;

        public string Naziv => "Update korisnika";

        public void Izvrsi(KorisnikDto dto)
        {
            _validator.ValidateAndThrow(dto);
            var korisnik = _context.Korisnici.Find(dto.Id);

            if (korisnik == null)
            {
                throw new EntityNotFoundException(dto.Id, typeof(Korisnik));
            }

            korisnik.Ime = dto.Ime;
            korisnik.Prezime = dto.Prezime;
            korisnik.KorisnickoIme = dto.KorisnickoIme;
            korisnik.Lozinka = dto.Lozinka;
            korisnik.Email = dto.Email;
            korisnik.GrupaId = dto.GrupaId;

            foreach(var item in dto.KorisnikUseCase)
            {
                korisnik.KorisnikUseCases.Add(new KorisnikUseCase
                {
                    KorisnikId = item.Id,
                    UseCaseId = item.Usecase
                });
            }

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
