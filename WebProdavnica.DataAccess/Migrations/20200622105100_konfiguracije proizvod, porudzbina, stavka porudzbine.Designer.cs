﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using WebProdavnica.DataAccess;

namespace WebProdavnica.DataAccess.Migrations
{
    [DbContext(typeof(WebProdavnicaContext))]
    [Migration("20200622105100_konfiguracije proizvod, porudzbina, stavka porudzbine")]
    partial class konfiguracijeproizvodporudzbinastavkaporudzbine
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("WebProdavnica.Domain.Grupa", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<DateTime?>("ModifiedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(30)")
                        .HasMaxLength(30);

                    b.HasKey("Id");

                    b.HasIndex("Naziv")
                        .IsUnique();

                    b.ToTable("Grupe");
                });

            modelBuilder.Entity("WebProdavnica.Domain.Korisnik", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("GrupaId")
                        .HasColumnType("int");

                    b.Property<string>("Ime")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<string>("KorisnickoIme")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.Property<string>("Lozinka")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("ModifiedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Prezime")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.HasKey("Id");

                    b.HasIndex("GrupaId");

                    b.HasIndex("KorisnickoIme")
                        .IsUnique();

                    b.ToTable("Korisnici");
                });

            modelBuilder.Entity("WebProdavnica.Domain.KorisnikUseCase", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<int>("UseCaseId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("KorisnikId");

                    b.ToTable("KorisnikUseCase");
                });

            modelBuilder.Entity("WebProdavnica.Domain.Porudzbina", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Adresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ModifiedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("VremePorudzbine")
                        .HasColumnType("datetime2");

                    b.Property<int>("status")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasDefaultValue(0);

                    b.HasKey("Id");

                    b.HasIndex("KorisnikId");

                    b.ToTable("Porudzbine");
                });

            modelBuilder.Entity("WebProdavnica.Domain.Proizvod", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<decimal>("Cena")
                        .HasColumnType("decimal(18,2)");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int>("Kolicina")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ModifiedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Opis")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Slika")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("Naziv")
                        .IsUnique();

                    b.ToTable("Proizvodi");
                });

            modelBuilder.Entity("WebProdavnica.Domain.StavkaPorudzbine", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int>("Kolicina")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ModifiedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Naziv")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("PorudzbinaId")
                        .HasColumnType("int");

                    b.Property<int?>("ProizvodId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("PorudzbinaId");

                    b.HasIndex("ProizvodId");

                    b.ToTable("StavkePorudzbine");
                });

            modelBuilder.Entity("WebProdavnica.Domain.UseCaseLog", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Actor")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Data")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Datum")
                        .HasColumnType("datetime2");

                    b.Property<string>("UseCaseNaziv")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("UseCaseLogs");
                });

            modelBuilder.Entity("WebProdavnica.Domain.Korisnik", b =>
                {
                    b.HasOne("WebProdavnica.Domain.Grupa", "Grupa")
                        .WithMany("Korisnici")
                        .HasForeignKey("GrupaId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();
                });

            modelBuilder.Entity("WebProdavnica.Domain.KorisnikUseCase", b =>
                {
                    b.HasOne("WebProdavnica.Domain.Korisnik", "Korisnik")
                        .WithMany("KorisnikUseCases")
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("WebProdavnica.Domain.Porudzbina", b =>
                {
                    b.HasOne("WebProdavnica.Domain.Korisnik", "Korisnik")
                        .WithMany()
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("WebProdavnica.Domain.StavkaPorudzbine", b =>
                {
                    b.HasOne("WebProdavnica.Domain.Porudzbina", "Porudzbina")
                        .WithMany("StavkaPorudzbine")
                        .HasForeignKey("PorudzbinaId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("WebProdavnica.Domain.Proizvod", "Proizvod")
                        .WithMany("StavkaPorudzbines")
                        .HasForeignKey("ProizvodId")
                        .OnDelete(DeleteBehavior.SetNull);
                });
#pragma warning restore 612, 618
        }
    }
}
