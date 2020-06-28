using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Windows.Input;
using WebProdavnica.Application.Exceptions;

namespace WebProdavnica.Application
{
    public class UseCaseExecutor
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseLogger loger;

        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger loger)
        {
            this.actor = actor;
            this.loger = loger;
        }

        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch,TResult> query, TSearch search)
        {
            loger.Log(query, actor, search);

            if (!actor.AllowedUseCases.Contains(query.Id))
            {
                throw new UnauthorizedUseCaseException(query, actor);
            }

            return query.Izvrsi(search);
        }

        public void ExecuteCommand<TRequest>(ICommand<TRequest> command, TRequest request)
        {
            loger.Log(command, actor, request);

            if (!actor.AllowedUseCases.Contains(command.Id)) {
                throw new UnauthorizedUseCaseException(command , actor);
            }
            command.Izvrsi(request);
        }
    }
}
