using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class UpdateKategorijuValidator : AbstractValidator<KategorijaDto>
    {
        public UpdateKategorijuValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Naziv).NotEmpty().WithMessage("Morate uneti naziv kategorije");
            RuleFor(x => x.Naziv).Must((dto, naziv) => !context.Kategorije.Any(k => k.Naziv == naziv && k.Id != dto.Id)).WithMessage("Naziv kategorije vec postoji");

        }
    }
}
