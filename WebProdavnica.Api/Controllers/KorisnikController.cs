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
    public class KorisnikController : ControllerBase
    {

        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor excutor;

        public KorisnikController(IApplicationActor actor, UseCaseExecutor excutor)
        {
            this.actor = actor;
            this.excutor = excutor;
        }

        // GET: api/<KorisnikController>
        [HttpGet]
        public IActionResult Get([FromQuery] KorisnikSearch search, [FromServices] IGetKorisniciQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, search));
        }

        // GET api/<KorisnikController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetKorisnikQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, id));
        }

        // PUT api/<KorisnikController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] KorisnikDto dto, [FromServices] IUpdateKorisnikCommand command)
        {
            dto.Id = id;
            this.excutor.ExecuteCommand(command, dto);
        }

        // DELETE api/<KorisnikController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteKorisnikCommand command)
        {
            excutor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
