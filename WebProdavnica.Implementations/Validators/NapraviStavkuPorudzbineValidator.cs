using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class NapraviStavkuPorudzbineValidator : AbstractValidator<NapraviStavkuPorudzbineDto>
    {
        private readonly WebProdavnicaContext _context;

        public NapraviStavkuPorudzbineValidator(WebProdavnicaContext context)
        {
            _context = context;

            RuleFor(x => x.ProizvodId).Must(DaLiProizvodPostoji).WithMessage("Trazeni proizvod ne postoji")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Kolicina).GreaterThan(0).WithMessage("Kolicina mora biti veca od 0")
                    .Must(DaLiImaNaStanju).WithMessage("Uneta kolicina je veca od one koju imamo na stanju");

                });
        }

        private bool DaLiProizvodPostoji(int proizvodId)
        {
            return _context.Proizvodi.Any(p => p.Id == proizvodId);
        }

        private bool DaLiImaNaStanju(NapraviStavkuPorudzbineDto dto, int kolicina)
        {
            return _context.Proizvodi.Find(dto.ProizvodId).Kolicina > kolicina;
        }
    }
}
