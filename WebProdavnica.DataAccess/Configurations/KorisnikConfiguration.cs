using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess.Configurations
{
    public class KorisnikConfiguration : IEntityTypeConfiguration<Korisnik>
    {
        public void Configure(EntityTypeBuilder<Korisnik> builder)
        {
            builder.HasIndex(x => x.KorisnickoIme).IsUnique();
            builder.Property(x => x.KorisnickoIme).HasMaxLength(20);
            builder.Property(x => x.Ime).IsRequired().HasMaxLength(20);
            builder.Property(x => x.Prezime).IsRequired().HasMaxLength(20);

            builder.HasMany(k => k.Porudzbine).WithOne(p => p.Korisnik).HasForeignKey(p => p.KorisnikId).OnDelete(DeleteBehavior.Restrict);

        }
    }
}
