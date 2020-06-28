using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using WebProdavnica.DataAccess.Configurations;
using WebProdavnica.Domain;

namespace WebProdavnica.DataAccess
{
    public class WebProdavnicaContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new GrupaConfiguration());
            modelBuilder.ApplyConfiguration(new KorisnikConfiguration());
            modelBuilder.ApplyConfiguration(new PorudzbinaConfiguration());
            modelBuilder.ApplyConfiguration(new ProizvodConfiguration());
            modelBuilder.ApplyConfiguration(new KategorijaConfiguration());

            modelBuilder.Entity<Grupa>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Korisnik>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Proizvod>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Porudzbina>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<StavkaPorudzbine>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Kategorija>().HasQueryFilter(x => !x.IsDeleted);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=mydb;Integrated Security=True");
            base.OnConfiguring(optionsBuilder);
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.Now;
                            e.IsDeleted = false;
                            e.ModifiedAt = null;
                            e.DeletedAt = null;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.Now;
                            break;
                        case EntityState.Deleted:
                            Entry(e).State = EntityState.Modified;
                            e.DeletedAt = DateTime.Now;
                            e.IsActive = false;
                            e.IsDeleted = true;
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }

        public DbSet<Grupa> Grupe { get; set; }
        public DbSet<Korisnik> Korisnici { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<Proizvod> Proizvodi { get; set; }
        public DbSet<Porudzbina> Porudzbine { get; set; }
        public DbSet<StavkaPorudzbine> StavkePorudzbine { get; set; }
        public DbSet<Kategorija> Kategorije { get; set; }
    }
}
