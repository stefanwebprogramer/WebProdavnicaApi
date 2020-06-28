using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess.Configurations
{
    public class GrupaConfiguration : IEntityTypeConfiguration<Grupa>
    {
        public void Configure(EntityTypeBuilder<Grupa> builder)
        {
            builder.Property(x => x.Naziv).HasMaxLength(30);
            builder.HasIndex(x => x.Naziv).IsUnique();
            builder.Property(x => x.Naziv).IsRequired();

            builder.HasMany(g => g.Korisnici).WithOne(k => k.Grupa).HasForeignKey(k => k.GrupaId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
