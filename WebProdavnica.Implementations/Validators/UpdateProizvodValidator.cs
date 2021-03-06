﻿using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Implementations.Validators
{
    public class UpdateProizvodValidator : AbstractValidator<ProizvodDto>
    {
        public UpdateProizvodValidator(WebProdavnicaContext context)
        {
            RuleFor(x => x.Naziv).NotEmpty().WithMessage("Naziv je obavezan");
            RuleFor(x => x.Cena).NotEmpty().WithMessage("Cena je obavezna");
            RuleFor(x => x.Opis).NotEmpty().WithMessage("Opis je obavezan");
            RuleFor(x => x.KategorijaId).NotEmpty().WithMessage("Morate uneti kategoriju proizvoda");
            RuleFor(x => x.Naziv).Must((dto,naz) => !context.Proizvodi.Any(x => x.Naziv == naz && x.Id != dto.Id)).WithMessage("Naziv je zauzet");

        }
    }
}
