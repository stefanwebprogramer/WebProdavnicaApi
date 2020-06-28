﻿using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using WebProdavnica.DataAccess;

namespace WebProdavnica.Api.Core
{
    public class JwtManager
    {
        private readonly WebProdavnicaContext _context;

        public JwtManager(WebProdavnicaContext context)
        {
            _context = context;
        }

        public string MakeToken(string username, string password)
        {
            var korisnik = _context.Korisnici.Include(u => u.KorisnikUseCases)
                .FirstOrDefault(x => x.KorisnickoIme == username && x.Lozinka == password);

            if(username == null)
            {
                return null;
            }
            var actor = new JwtActor
            {
                Id = korisnik.Id,
                AllowedUseCases = korisnik.KorisnikUseCases.Select(x => x.UseCaseId),
                Identity = korisnik.KorisnickoIme
            };

            var issuer = "asp_api";
            var secretKey = "ThisIsMyVerySecretKey";
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "asp_api", ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddSeconds(6000),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
