using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application
{
    public interface ICommand<TRequest> : IUseCase
    {
        void Izvrsi(TRequest request);
    }

    public interface IQuery<TSearch, TResult> : IUseCase
    {
        TResult Izvrsi(TSearch search);
    }

    public interface IUseCase
    { 
        int Id { get; }
        string Naziv { get; }
    }
}
