using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.DataTransfer;

namespace WebProdavnica.Application.Queries
{
    public interface IGetKategorijaQuery : IQuery<int,KategorijaDto>
    {
    }
}
