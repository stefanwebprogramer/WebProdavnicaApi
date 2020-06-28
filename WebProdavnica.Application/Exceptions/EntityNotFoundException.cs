using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.Exceptions
{
    public class EntityNotFoundException : Exception
    {
        public EntityNotFoundException(int id, Type type)
            : base($"Entitet tipa {type.Name} sa id-em {id} nije pronadjen")
        {

        }
    }
}
