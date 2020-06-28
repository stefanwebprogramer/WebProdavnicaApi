using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebProdavnica.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        // POST api/<UploadController>
        [HttpPost]
        public void Post([FromForm] UploadDto dto)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(dto.Slika.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "Slike", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.Slika.CopyTo(fileStream);
            }

            //upis newfilename u bazu
        }
    }

    public class UploadDto {
        public IFormFile Slika { get; set; }
    }
}
