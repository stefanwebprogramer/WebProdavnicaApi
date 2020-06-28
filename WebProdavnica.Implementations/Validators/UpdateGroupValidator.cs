using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class UpdateGroupValidator : AbstractValidator<GrupaDto>
    {
        public UpdateGroupValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Naziv).NotEmpty().WithMessage("Morate uneti naziv grupe");   
            RuleFor(x=>x.Naziv).Must((dto, naziv) => !context.Grupe.Any(p => p.Naziv == naziv && p.Id != dto.Id))
                .WithMessage("Ime grupe je zauzeto");
        }
    }
}
