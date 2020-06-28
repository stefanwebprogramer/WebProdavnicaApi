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
    public class PorudzbinaController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _excutor;

        public PorudzbinaController(IApplicationActor actor, UseCaseExecutor excutor)
        {
            _actor = actor;
            _excutor = excutor;
        }

        // GET: api/<PorudzbinaController>
        [HttpGet]
        public IActionResult Get([FromQuery] PorudzbinaSearch search, [FromServices] IGetPorudzbineQuery query)
        {
            return Ok(_excutor.ExecuteQuery(query, search));
        }

        // GET api/<PorudzbinaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromServices] IGetPorudzbinaQuery query)
        {
            return Ok(_excutor.ExecuteQuery(query, id));
        }

        // POST api/<PorudzbinaController>
        [HttpPost]
        public void Post([FromBody] NapraviPorudzbinuDto dto, [FromServices] ICreatePorudzbinuCommand command)
        {
            _excutor.ExecuteCommand(command, dto);
        }
    }
}
