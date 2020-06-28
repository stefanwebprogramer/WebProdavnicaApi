using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.DataTransfer;

namespace WebProdavnica.Application.Queries
{
    public interface IGetPorudzbinaQuery : IQuery<int,PorudzbinaDto>
    {
    }
}
