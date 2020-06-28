using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor) 
            : base($"Actor {actor.Identity} sa id-em {actor.Id} pokusava da izvrsi {useCase.Naziv}.")
        {

        }
    }
}
