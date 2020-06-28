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
    public class UpdateKorisnikValidator : AbstractValidator<KorisnikDto>
    {
        public UpdateKorisnikValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Ime).NotEmpty().WithMessage("Ime je obavezno");
            RuleFor(x => x.Prezime).NotEmpty().WithMessage("Prezime je obavezno");
            RuleFor(x => x.Lozinka).NotEmpty().WithMessage("Lozinka je obavezna");
            RuleFor(x => x.Lozinka).MinimumLength(6).WithMessage("Lozinka mora imati najmanje 6 karaktera");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email je obavezam");
            RuleFor(x => x.Email).EmailAddress().WithMessage("Email nije u dobrom formatu");
            RuleFor(x => x.GrupaId).NotEmpty().WithMessage("Morate uneti grupu za korisnika");

            RuleFor(x => x.KorisnickoIme).NotEmpty().WithMessage("Korisnicko ime je obavezno");
            RuleFor(x => x.KorisnickoIme).MinimumLength(4).WithMessage("Korisnicko ime mora imati minimum 4 karaktera");
            RuleFor(x => x.KorisnickoIme).Must((dto, korIme) => !context.Korisnici.Any(x => x.KorisnickoIme == korIme && x.Id != dto.Id)).WithMessage("Korisnicko ime je zauzeto");

        }
    }
}
