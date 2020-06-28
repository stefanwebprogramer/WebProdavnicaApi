using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class NapraviPorudzbinuValidator : AbstractValidator<NapraviPorudzbinuDto>
    {
        private readonly WebProdavnicaContext _context;
        public NapraviPorudzbinuValidator(WebProdavnicaContext context)
        {
            _context = context;
            RuleFor(x => x.VremePorudzbine).GreaterThan(DateTime.Today).WithMessage("Vreme Porudzbine mora biti vece od danasnjeg dana");
            RuleFor(x => x.VremePorudzbine).LessThan(DateTime.Today.AddDays(30)).WithMessage("Vreme Porudzbine mora biti manje od mesec dana");

            RuleFor(x => x.Adresa).NotEmpty().WithMessage("Adresa je obavezna");

            RuleFor(x => x.StavkePorudzbine).NotEmpty().WithMessage("Morate dodati bar jedan proizvod")
                .Must(sp => sp.Select(x => x.ProizvodId).Distinct().Count() == sp.Count()).WithMessage("Dupliranje proizvoda nije dozvoljeno")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.StavkePorudzbine).SetValidator(new NapraviStavkuPorudzbineValidator(_context));
                });
        }
    }
}
