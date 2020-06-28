USE [master]
GO
/****** Object:  Database [mydb]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE DATABASE [mydb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mydb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mydb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mydb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mydb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mydb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mydb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mydb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mydb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mydb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mydb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mydb] SET ARITHABORT OFF 
GO
ALTER DATABASE [mydb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mydb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mydb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mydb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mydb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mydb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mydb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mydb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mydb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mydb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mydb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mydb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mydb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mydb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mydb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mydb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mydb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mydb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mydb] SET  MULTI_USER 
GO
ALTER DATABASE [mydb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mydb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mydb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mydb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mydb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mydb] SET QUERY_STORE = OFF
GO
USE [mydb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupe]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Grupe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorije]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorije](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Kategorije] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[KorisnickoIme] [nvarchar](20) NOT NULL,
	[Ime] [nvarchar](20) NOT NULL,
	[Prezime] [nvarchar](20) NOT NULL,
	[Lozinka] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[GrupaId] [int] NOT NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KorisnikUseCase]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KorisnikUseCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_KorisnikUseCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porudzbine]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porudzbine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[VremePorudzbine] [datetime2](7) NOT NULL,
	[KorisnikId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[Adresa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Porudzbine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](450) NOT NULL,
	[Cena] [decimal](18, 2) NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[Slika] [nvarchar](max) NULL,
	[Kolicina] [int] NOT NULL,
	[KategorijaId] [int] NOT NULL,
 CONSTRAINT [PK_Proizvodi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkePorudzbine]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkePorudzbine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Kolicina] [int] NOT NULL,
	[PorudzbinaId] [int] NOT NULL,
	[ProizvodId] [int] NULL,
	[Cena] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_StavkePorudzbine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/28/2020 3:44:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime2](7) NOT NULL,
	[UseCaseNaziv] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Grupe_Naziv]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Grupe_Naziv] ON [dbo].[Grupe]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Kategorije_Naziv]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Kategorije_Naziv] ON [dbo].[Kategorije]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Korisnici_GrupaId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Korisnici_GrupaId] ON [dbo].[Korisnici]
(
	[GrupaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Korisnici_KorisnickoIme]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Korisnici_KorisnickoIme] ON [dbo].[Korisnici]
(
	[KorisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KorisnikUseCase_KorisnikId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_KorisnikUseCase_KorisnikId] ON [dbo].[KorisnikUseCase]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Porudzbine_KorisnikId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Porudzbine_KorisnikId] ON [dbo].[Porudzbine]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proizvodi_KategorijaId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proizvodi_KategorijaId] ON [dbo].[Proizvodi]
(
	[KategorijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Proizvodi_Naziv]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Proizvodi_Naziv] ON [dbo].[Proizvodi]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StavkePorudzbine_PorudzbinaId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_StavkePorudzbine_PorudzbinaId] ON [dbo].[StavkePorudzbine]
(
	[PorudzbinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StavkePorudzbine_ProizvodId]    Script Date: 6/28/2020 3:44:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_StavkePorudzbine_ProizvodId] ON [dbo].[StavkePorudzbine]
(
	[ProizvodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Porudzbine] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Proizvodi] ADD  DEFAULT ((0)) FOR [KategorijaId]
GO
ALTER TABLE [dbo].[StavkePorudzbine] ADD  DEFAULT ((0.0)) FOR [Cena]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_Grupe_GrupaId] FOREIGN KEY([GrupaId])
REFERENCES [dbo].[Grupe] ([Id])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_Grupe_GrupaId]
GO
ALTER TABLE [dbo].[KorisnikUseCase]  WITH CHECK ADD  CONSTRAINT [FK_KorisnikUseCase_Korisnici_KorisnikId] FOREIGN KEY([KorisnikId])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisnikUseCase] CHECK CONSTRAINT [FK_KorisnikUseCase_Korisnici_KorisnikId]
GO
ALTER TABLE [dbo].[Porudzbine]  WITH CHECK ADD  CONSTRAINT [FK_Porudzbine_Korisnici_KorisnikId] FOREIGN KEY([KorisnikId])
REFERENCES [dbo].[Korisnici] ([Id])
GO
ALTER TABLE [dbo].[Porudzbine] CHECK CONSTRAINT [FK_Porudzbine_Korisnici_KorisnikId]
GO
ALTER TABLE [dbo].[Proizvodi]  WITH CHECK ADD  CONSTRAINT [FK_Proizvodi_Kategorije_KategorijaId] FOREIGN KEY([KategorijaId])
REFERENCES [dbo].[Kategorije] ([Id])
GO
ALTER TABLE [dbo].[Proizvodi] CHECK CONSTRAINT [FK_Proizvodi_Kategorije_KategorijaId]
GO
ALTER TABLE [dbo].[StavkePorudzbine]  WITH CHECK ADD  CONSTRAINT [FK_StavkePorudzbine_Porudzbine_PorudzbinaId] FOREIGN KEY([PorudzbinaId])
REFERENCES [dbo].[Porudzbine] ([Id])
GO
ALTER TABLE [dbo].[StavkePorudzbine] CHECK CONSTRAINT [FK_StavkePorudzbine_Porudzbine_PorudzbinaId]
GO
ALTER TABLE [dbo].[StavkePorudzbine]  WITH CHECK ADD  CONSTRAINT [FK_StavkePorudzbine_Proizvodi_ProizvodId] FOREIGN KEY([ProizvodId])
REFERENCES [dbo].[Proizvodi] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[StavkePorudzbine] CHECK CONSTRAINT [FK_StavkePorudzbine_Proizvodi_ProizvodId]
GO
USE [master]
GO
ALTER DATABASE [mydb] SET  READ_WRITE 
GO
