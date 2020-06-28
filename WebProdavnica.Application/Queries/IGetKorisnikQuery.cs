using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.DataTransfer;

namespace WebProdavnica.Application.Queries
{
    public interface IGetKorisnikQuery : IQuery<int, KorisnikDto>
    {
    }
}
