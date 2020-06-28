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
    public class EfNapraviPorudzbinuCommand : ICreatePorudzbinuCommand
    {
        private readonly WebProdavnicaContext _context;
        private readonly NapraviPorudzbinuValidator _validator;

        public EfNapraviPorudzbinuCommand(WebProdavnicaContext context, NapraviPorudzbinuValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 7;

        public string Naziv => "Pravljenje porudzbine";

        public void Izvrsi(NapraviPorudzbinuDto dto)
        {
            _validator.ValidateAndThrow(dto);

            var korisnikId = 4;

            var porudzbina = new Porudzbina
            {
                KorisnikId = korisnikId,
                Adresa = dto.Adresa,
                VremePorudzbine = dto.VremePorudzbine,
            };

            foreach (var item in dto.StavkePorudzbine)
            {
                var product = _context.Proizvodi.Find(item.ProizvodId);

                product.Kolicina -= item.Kolicina;

                porudzbina.StavkaPorudzbine.Add(new StavkaPorudzbine
                {
                    ProizvodId = item.ProizvodId,
                    Kolicina = item.Kolicina,
                    Naziv = product.Naziv,
                    Cena = product.Cena
                });
            }

            _context.Porudzbine.Add(porudzbina);

            _context.SaveChanges();
        }
    }
}
