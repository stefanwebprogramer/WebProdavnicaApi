using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebProdavnica.Application;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Queries;
using WebProdavnica.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebProdavnica.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ProizvodController : ControllerBase
    {
        private readonly UseCaseExecutor excutor;

        public ProizvodController(UseCaseExecutor excutor)
        {
            this.excutor = excutor;
        }

        // GET: api/<ProizvodController>
        [HttpGet]
        public IActionResult Get([FromQuery] ProizvodSearch search, [FromServices] IGetProizvodiQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, search));
        }

        // GET api/<ProizvodController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetProizvodQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, id));
        }

        // POST api/<ProizvodController>
        [HttpPost]
        public void Post([FromBody] ProizvodDto dto, [FromServices] ICreateProizvodCommand command)
        {
            this.excutor.ExecuteCommand(command, dto);
        }

        // PUT api/<ProizvodController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] ProizvodDto dto, [FromServices] IUpdateProizvodCommand command)
        {
            dto.Id = id;
            this.excutor.ExecuteCommand(command, dto);
        }

        // DELETE api/<ProizvodController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteProizvodCommand command)
        {
            excutor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
