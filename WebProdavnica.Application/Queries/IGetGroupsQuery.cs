using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Searches;

namespace WebProdavnica.Application.Queries
{
    public interface IGetGroupsQuery : IQuery<GroupSearch, PagedResponse<GrupaDto>>
    {

    }
}
