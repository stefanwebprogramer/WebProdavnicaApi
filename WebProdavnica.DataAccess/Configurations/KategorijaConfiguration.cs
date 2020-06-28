using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess.Configurations
{
    public class KategorijaConfiguration :IEntityTypeConfiguration<Kategorija>
    {
        public void Configure(EntityTypeBuilder<Kategorija> builder)
        {
            builder.Property(x => x.Naziv).HasMaxLength(30);
            builder.HasIndex(x => x.Naziv).IsUnique();
            builder.Property(x => x.Naziv).IsRequired();

            builder.HasMany(k => k.Proizvodi).WithOne(p => p.Kategorija).HasForeignKey(p => p.KategorijaId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
