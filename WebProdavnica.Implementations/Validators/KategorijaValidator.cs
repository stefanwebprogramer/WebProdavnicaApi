using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class KategorijaValidator : AbstractValidator<KategorijaDto>
    {
        public KategorijaValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Naziv).NotEmpty().WithMessage("Morate uneti naziv kategorije");

            RuleFor(x => x.Naziv).Must(naziv => !context.Kategorije.Any(k => k.Naziv == naziv)).WithMessage("Naziv kategorije vec postoji");
        }
    }
}
