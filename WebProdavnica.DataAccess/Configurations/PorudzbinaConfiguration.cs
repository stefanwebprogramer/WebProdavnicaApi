using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess.Configurations
{
    public class PorudzbinaConfiguration : IEntityTypeConfiguration<Porudzbina>
    {
        public void Configure(EntityTypeBuilder<Porudzbina> builder)
        {
            builder.Property(x => x.status).HasDefaultValue(StatusPorudzbine.Primljena);

            builder.HasMany(x => x.StavkaPorudzbine).WithOne(s => s.Porudzbina).HasForeignKey(x => x.PorudzbinaId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
