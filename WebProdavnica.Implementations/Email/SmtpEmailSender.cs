using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;
using WebProdavnica.Application.Email;

namespace WebProdavnica.Implementations.Email
{
    public class SmtpEmailSender : IEmailSender
    {
        public void Send(PosaljiEmailDto dto)
        {

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("aspictrs@gmail.com", "Sifra123!")
            };

            var message = new MailMessage("aspictrs@gmail.com", dto.Kome);
            message.Subject = dto.Naslov;
            message.Body = dto.Sadrzaj;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
