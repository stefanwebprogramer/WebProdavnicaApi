using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebProdavnica.Application;
using WebProdavnica.Application.Commands;
using WebProdavnica.Application.DataTransfer;
using WebProdavnica.Application.Exceptions;
using WebProdavnica.Application.Queries;
using WebProdavnica.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebProdavnica.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GrupeController : ControllerBase
    {

        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor excutor;

        public GrupeController(IApplicationActor actor, UseCaseExecutor excutor)
        {
            this.actor = actor;
            this.excutor = excutor;
        }

        // GET: api/<GrupeController>
        [HttpGet]
        public IActionResult Get([FromQuery] GroupSearch search, [FromServices] IGetGroupsQuery query)
        {
           return Ok(excutor.ExecuteQuery(query,search)) ;
        }

        // GET api/<GrupeController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetGroupQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, id));
        }

        // POST api/<GrupeController>
        [HttpPost]
        public void Post([FromBody] GrupaDto dto,
            [FromServices] ICreateGroupCommand command)
        {
            this.excutor.ExecuteCommand(command,dto);
        }

        // PUT api/<GrupeController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] GrupaDto dto, [FromServices] IUpdateGroupCommand command)
        {
            dto.Id = id;
            this.excutor.ExecuteCommand(command, dto);
        }

        // DELETE api/<GrupeController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteGroupCommand command)
        {
            excutor.ExecuteCommand(command, id);
            return NoContent();
            
        }
    }
}
