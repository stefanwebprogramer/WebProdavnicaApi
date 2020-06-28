using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebProdavnica.Application;
using WebProdavnica.Application.Queries;
using WebProdavnica.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebProdavnica.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsecaseController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor excutor;

        public UsecaseController(IApplicationActor actor, UseCaseExecutor excutor)
        {
            this.actor = actor;
            this.excutor = excutor;
        }
        // GET: api/<KorisnikController>
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogSearch search, [FromServices] IGetUseCaseLogQuery query)
        {
            return Ok(excutor.ExecuteQuery(query, search));
        }

        // PUT api/<UsecaseController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }
    }
}
