using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.DataTransfer
{
    public class KategorijaDto
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? ModifiedAt { get; set; }
        public DateTime? DeletedAt { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
    }
}
