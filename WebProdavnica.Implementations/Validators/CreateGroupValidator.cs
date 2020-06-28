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
    public class CreateGroupValidator : AbstractValidator<GrupaDto>
    {
        public CreateGroupValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Naziv).NotEmpty().WithMessage("Morate uneti naziv grupe");

            RuleFor(x => x.Naziv).Must(naziv => !context.Grupe.Any(g => g.Naziv == naziv)).WithMessage("Ime grupe vec postoji");
        }
    }
}
