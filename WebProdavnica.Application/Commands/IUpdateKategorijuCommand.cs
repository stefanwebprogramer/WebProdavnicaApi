using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.DataTransfer;

namespace WebProdavnica.Application.Commands
{
    public interface IUpdateKategorijuCommand : ICommand<KategorijaDto>
    {
    }
}
