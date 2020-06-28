using System;
using System.Collections.Generic;
using System.Text;

namespace WebProdavnica.Application.Email
{
    public interface IEmailSender
    {
        void Send(PosaljiEmailDto dto);
    }

    public class PosaljiEmailDto
    {
        public string Naslov { get; set; }
        public string Sadrzaj { get; set; }
        public string Kome { get; set; }
    }
}
