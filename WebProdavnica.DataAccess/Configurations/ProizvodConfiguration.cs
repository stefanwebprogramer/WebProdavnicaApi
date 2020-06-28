using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess.Configurations
{
    public class ProizvodConfiguration : IEntityTypeConfiguration<Proizvod>
    {
        public void Configure(EntityTypeBuilder<Proizvod> builder)
        {
            builder.Property(x => x.Naziv).IsRequired();
            builder.HasIndex(x => x.Naziv).IsUnique();
            builder.HasMany(x => x.StavkaPorudzbines).WithOne(s => s.Proizvod).HasForeignKey(sp => sp.ProizvodId).OnDelete(DeleteBehavior.SetNull);
        }
    }
}
