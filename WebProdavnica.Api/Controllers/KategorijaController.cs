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
    public class KategorijaController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor excutor;

        public KategorijaController(IApplicationActor actor, UseCaseExecutor excutor)
        {
            this.actor = actor;
            this.excutor = excutor;
        }
        // GET: api/<KategorijaController>
        [HttpGet]
        public IActionResult Get([FromQuery] KategorijaSearch search, [FromServices] IGetKategorijeQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, search));
        }

        // GET api/<KategorijaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetKategorijaQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, id));
        }

        // POST api/<KategorijaController>
        [HttpPost]
        public void Post([FromBody] KategorijaDto dto,
            [FromServices] ICreateKategorijaCommand command)
        {
            this.excutor.ExecuteCommand(command, dto);
        }

        // PUT api/<KategorijaController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] KategorijaDto dto, [FromServices] IUpdateKategorijuCommand command)
        {
            dto.Id = id;
            this.excutor.ExecuteCommand(command, dto);
        }

        // DELETE api/<KategorijaController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteKategorijuCommand command)
        {
            excutor.ExecuteCommand(command, id);
            return NoContent();

        }
    }
}
