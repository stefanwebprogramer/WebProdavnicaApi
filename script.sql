USE [master]
GO
/****** Object:  Database [mydb]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[Grupe]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[Kategorije]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[Korisnici]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[KorisnikUseCase]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[Porudzbine]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[StavkePorudzbine]    Script Date: 7/1/2020 9:41:15 PM ******/
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
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 7/1/2020 9:41:15 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620100005_inicijalna migracija', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621134157_grupe i korisnici', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621134416_inicijalna migracija', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621144413_proizvod - porudzbina', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622105100_konfiguracije proizvod, porudzbina, stavka porudzbine', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200622125605_korisnik - porudzbina povezivanje', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623123659_dodate-kategorije', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200624115910_dodata cena u stavku porudzbine', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Grupe] ON 

INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (1, CAST(N'2020-06-21T15:45:18.4030715' AS DateTime2), CAST(N'2020-06-21T15:47:19.5042883' AS DateTime2), CAST(N'2020-06-21T15:50:56.3086807' AS DateTime2), 1, 1, N'Prva update')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (2, CAST(N'2020-06-21T16:09:18.0620037' AS DateTime2), CAST(N'2020-06-22T14:23:46.9522824' AS DateTime2), CAST(N'2020-06-22T14:29:33.1200103' AS DateTime2), 1, 0, N'Grupa 2')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (3, CAST(N'2020-06-22T14:04:02.5119315' AS DateTime2), CAST(N'2020-06-22T14:38:04.8581860' AS DateTime2), CAST(N'2020-06-23T16:30:39.8241166' AS DateTime2), 1, 0, N'Grupa 3 updt')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (4, CAST(N'2020-06-22T14:21:53.0734290' AS DateTime2), NULL, CAST(N'2020-06-23T16:36:36.7899540' AS DateTime2), 1, 0, N'Grupa 4')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (5, CAST(N'2020-06-23T17:57:08.8234503' AS DateTime2), NULL, CAST(N'2020-06-23T19:26:34.0737802' AS DateTime2), 1, 0, N'prva grupa')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (6, CAST(N'2020-06-28T14:47:16.7138147' AS DateTime2), NULL, NULL, 0, 1, N'Moja grupa')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (7, CAST(N'2020-07-01T21:34:50.1905730' AS DateTime2), NULL, NULL, 0, 1, N'grupa2')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (8, CAST(N'2020-07-01T21:34:54.4485032' AS DateTime2), NULL, NULL, 0, 1, N'grupa3')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (9, CAST(N'2020-07-01T21:34:56.9759784' AS DateTime2), NULL, NULL, 0, 1, N'grupa4')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (10, CAST(N'2020-07-01T21:34:59.7601667' AS DateTime2), NULL, NULL, 0, 1, N'grupa5')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (11, CAST(N'2020-07-01T21:35:02.3935198' AS DateTime2), NULL, NULL, 0, 1, N'grupa6')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (12, CAST(N'2020-07-01T21:35:05.1596367' AS DateTime2), NULL, NULL, 0, 1, N'grupa7')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (13, CAST(N'2020-07-01T21:35:09.4953366' AS DateTime2), NULL, NULL, 0, 1, N'asp')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (14, CAST(N'2020-07-01T21:35:12.4719035' AS DateTime2), NULL, NULL, 0, 1, N'php')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (15, CAST(N'2020-07-01T21:35:19.5847159' AS DateTime2), NULL, NULL, 0, 1, N'administratori')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (16, CAST(N'2020-07-01T21:35:25.6870425' AS DateTime2), NULL, NULL, 0, 1, N'obicni korisnici')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (17, CAST(N'2020-07-01T21:35:28.7417278' AS DateTime2), NULL, NULL, 0, 1, N'neobicni korisnici')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (18, CAST(N'2020-07-01T21:35:34.5363937' AS DateTime2), NULL, NULL, 0, 1, N'vanzemaljci')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (19, CAST(N'2020-07-01T21:35:38.7756040' AS DateTime2), NULL, NULL, 0, 1, N'komunisti')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (20, CAST(N'2020-07-01T21:35:46.3908484' AS DateTime2), NULL, NULL, 0, 1, N'zivotinje')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (21, CAST(N'2020-07-01T21:35:54.0888391' AS DateTime2), NULL, NULL, 0, 1, N'ljudi')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (22, CAST(N'2020-07-01T21:36:23.2083425' AS DateTime2), NULL, NULL, 0, 1, N'moja grupa 2')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (23, CAST(N'2020-07-01T21:36:26.5053741' AS DateTime2), NULL, NULL, 0, 1, N'moja grupa 3')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (24, CAST(N'2020-07-01T21:36:29.6127721' AS DateTime2), NULL, NULL, 0, 1, N'moja grupa 4')
INSERT [dbo].[Grupe] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv]) VALUES (25, CAST(N'2020-07-01T21:36:32.9874073' AS DateTime2), NULL, NULL, 0, 1, N'moja grupa 5')
SET IDENTITY_INSERT [dbo].[Grupe] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategorije] ON 

INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (1, CAST(N'2020-06-23T14:52:32.9080618' AS DateTime2), CAST(N'2020-06-23T16:21:33.6216740' AS DateTime2), 0, NULL, 1, N'Kategorija Update')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (2, CAST(N'2020-06-23T16:30:23.4389827' AS DateTime2), NULL, 1, CAST(N'2020-06-23T16:38:31.8459937' AS DateTime2), 0, N'Kategorija 2')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (3, CAST(N'2020-06-23T16:30:27.0317278' AS DateTime2), NULL, 0, NULL, 1, N'Kategorija 3')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (4, CAST(N'2020-06-23T16:30:31.5141254' AS DateTime2), NULL, 0, NULL, 1, N'Kategorija 4')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (5, CAST(N'2020-06-28T15:16:25.6908527' AS DateTime2), NULL, 0, NULL, 1, N'Telefon ')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (6, CAST(N'2020-06-28T15:16:30.5704719' AS DateTime2), NULL, 0, NULL, 1, N'patike ')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (7, CAST(N'2020-06-28T15:16:36.9625614' AS DateTime2), NULL, 0, NULL, 1, N'automobil ')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (8, CAST(N'2020-06-28T15:41:46.9452564' AS DateTime2), NULL, 0, NULL, 1, N'odeca')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (9, CAST(N'2020-07-01T21:37:11.2444637' AS DateTime2), NULL, 0, NULL, 1, N'zvucnici')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (10, CAST(N'2020-07-01T21:37:16.5170931' AS DateTime2), NULL, 0, NULL, 1, N'kompujteri')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (11, CAST(N'2020-07-01T21:37:20.0089548' AS DateTime2), NULL, 0, NULL, 1, N'mikseri')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (12, CAST(N'2020-07-01T21:37:24.4609031' AS DateTime2), NULL, 0, NULL, 1, N'usisivaci')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (13, CAST(N'2020-07-01T21:37:28.9723992' AS DateTime2), NULL, 0, NULL, 1, N'upaljaci')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (14, CAST(N'2020-07-01T21:37:34.3795547' AS DateTime2), NULL, 0, NULL, 1, N'monitori')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (15, CAST(N'2020-07-01T21:37:38.0403550' AS DateTime2), NULL, 0, NULL, 1, N'misevi')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (16, CAST(N'2020-07-01T21:37:41.7894870' AS DateTime2), NULL, 0, NULL, 1, N'tableti')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (17, CAST(N'2020-07-01T21:37:51.1022864' AS DateTime2), NULL, 0, NULL, 1, N'ruteri')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (18, CAST(N'2020-07-01T21:37:56.6392673' AS DateTime2), NULL, 0, NULL, 1, N'radijatori')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (19, CAST(N'2020-07-01T21:37:59.5992190' AS DateTime2), NULL, 0, NULL, 1, N'stolice')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (20, CAST(N'2020-07-01T21:38:03.7733359' AS DateTime2), NULL, 0, NULL, 1, N'stolovi')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (21, CAST(N'2020-07-01T21:38:07.4837613' AS DateTime2), NULL, 0, NULL, 1, N'puske')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Naziv]) VALUES (22, CAST(N'2020-07-01T21:38:11.1984719' AS DateTime2), NULL, 0, NULL, 1, N'pistolji')
SET IDENTITY_INSERT [dbo].[Kategorije] OFF
GO
SET IDENTITY_INSERT [dbo].[Korisnici] ON 

INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [KorisnickoIme], [Ime], [Prezime], [Lozinka], [Email], [GrupaId]) VALUES (4, CAST(N'2020-06-23T18:00:19.6394202' AS DateTime2), CAST(N'2020-06-24T10:29:52.3709757' AS DateTime2), NULL, 0, 1, N'admin', N'admin', N'admin', N'admin123', N'stefan.stankovic.97.16@ict.edu.rs', 5)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [KorisnickoIme], [Ime], [Prezime], [Lozinka], [Email], [GrupaId]) VALUES (5, CAST(N'2020-06-23T19:25:42.5065402' AS DateTime2), NULL, CAST(N'2020-06-23T19:27:35.7609406' AS DateTime2), 1, 0, N'stele123', N'Stefan', N'Stankovic', N'sifra1243', N'stefan.stankovic.97.16@ict.edu.rs', 5)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [KorisnickoIme], [Ime], [Prezime], [Lozinka], [Email], [GrupaId]) VALUES (6, CAST(N'2020-06-28T15:40:48.9957951' AS DateTime2), NULL, NULL, 0, 1, N'miki123', N'Mika', N'Jovanovic', N'sifra123', N'stefan.stankovic.97.16@ict.edu.rs', 4)
SET IDENTITY_INSERT [dbo].[Korisnici] OFF
GO
SET IDENTITY_INSERT [dbo].[KorisnikUseCase] ON 

INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (7, 4, 1)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (8, 4, 2)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (9, 4, 3)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (10, 4, 4)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (11, 4, 5)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (12, 4, 6)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (13, 4, 7)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (14, 4, 8)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (15, 4, 9)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (16, 4, 10)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (17, 4, 11)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (18, 4, 12)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (19, 4, 13)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (20, 4, 14)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (21, 4, 15)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (22, 4, 16)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (23, 4, 17)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (24, 4, 18)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (25, 4, 19)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (26, 4, 20)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (27, 4, 21)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (28, 4, 22)
INSERT [dbo].[KorisnikUseCase] ([Id], [KorisnikId], [UseCaseId]) VALUES (29, 4, 23)
SET IDENTITY_INSERT [dbo].[KorisnikUseCase] OFF
GO
SET IDENTITY_INSERT [dbo].[Porudzbine] ON 

INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (1, CAST(N'2020-06-24T12:41:07.5909260' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (2, CAST(N'2020-06-24T12:43:23.2140766' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (3, CAST(N'2020-06-28T15:32:50.6089709' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (4, CAST(N'2020-06-28T15:35:22.6935611' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (5, CAST(N'2020-07-01T21:31:12.7630871' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (6, CAST(N'2020-07-01T21:31:23.9471581' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (7, CAST(N'2020-07-01T21:31:34.3011131' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (8, CAST(N'2020-07-01T21:31:44.2740645' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (9, CAST(N'2020-07-01T21:31:52.7846216' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (10, CAST(N'2020-07-01T21:31:59.4722085' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Kragujevacka 3')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (11, CAST(N'2020-07-01T21:32:24.8799499' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 18')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (12, CAST(N'2020-07-01T21:32:37.9123947' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (13, CAST(N'2020-07-01T21:33:01.8858872' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (14, CAST(N'2020-07-01T21:33:13.3704937' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (15, CAST(N'2020-07-01T21:33:26.9478310' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (16, CAST(N'2020-07-01T21:33:31.3304698' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (17, CAST(N'2020-07-01T21:33:44.2588575' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (18, CAST(N'2020-07-01T21:33:48.4015410' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (19, CAST(N'2020-07-01T21:33:49.0338118' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (20, CAST(N'2020-07-01T21:33:53.3567079' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [VremePorudzbine], [KorisnikId], [status], [Adresa]) VALUES (21, CAST(N'2020-07-01T21:34:14.5798409' AS DateTime2), NULL, NULL, 0, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), 4, 0, N'Ustanicka 19')
SET IDENTITY_INSERT [dbo].[Porudzbine] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] ON 

INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (1, CAST(N'2020-06-23T20:13:06.3952823' AS DateTime2), CAST(N'2020-07-01T21:33:53.3567109' AS DateTime2), NULL, 0, 1, N'Proizvod 1 ', CAST(900.00 AS Decimal(18, 2)), N'neki moj opis', NULL, 989, 1)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (2, CAST(N'2020-06-24T09:28:23.8805633' AS DateTime2), NULL, CAST(N'2020-06-24T09:46:03.7545449' AS DateTime2), 1, 0, N'Proizvod 2', CAST(800.00 AS Decimal(18, 2)), N'neki moj opis 2', NULL, 0, 1)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (5, CAST(N'2020-06-28T15:14:02.7022915' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 4', CAST(1900.00 AS Decimal(18, 2)), N'neki moj opis 2', NULL, 0, 1)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (6, CAST(N'2020-06-28T15:14:16.1506658' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 5', CAST(300.00 AS Decimal(18, 2)), N'neki moj opis 3', NULL, 0, 1)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (7, CAST(N'2020-06-28T15:15:49.4232424' AS DateTime2), CAST(N'2020-07-01T21:32:37.9123977' AS DateTime2), NULL, 0, 1, N'Samsung ', CAST(5220.00 AS Decimal(18, 2)), N'Telefon samsung', NULL, 998, 1)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (8, CAST(N'2020-06-28T15:18:47.4623935' AS DateTime2), CAST(N'2020-07-01T21:22:38.9579902' AS DateTime2), NULL, 0, 1, N'Nokia', CAST(900.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 1000, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (9, CAST(N'2020-06-28T15:22:15.8339238' AS DateTime2), CAST(N'2020-07-01T21:33:01.8858897' AS DateTime2), NULL, 0, 1, N'Iphone X', CAST(2000.00 AS Decimal(18, 2)), N'Iphone X', NULL, 1899, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (10, CAST(N'2020-06-28T15:22:33.9364283' AS DateTime2), CAST(N'2020-07-01T21:34:14.5798447' AS DateTime2), NULL, 0, 1, N'Samsung galaxy s6', CAST(500.00 AS Decimal(18, 2)), N'Samsung galaxy s6', NULL, 4228, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (11, CAST(N'2020-06-28T15:22:44.1742949' AS DateTime2), CAST(N'2020-07-01T21:33:26.9478340' AS DateTime2), NULL, 0, 1, N'Samsung galaxy s7', CAST(700.00 AS Decimal(18, 2)), N'Samsung galaxy s7', NULL, 315, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (12, CAST(N'2020-06-28T15:22:55.2463498' AS DateTime2), CAST(N'2020-07-01T21:33:31.3304736' AS DateTime2), NULL, 0, 1, N'Samsung galaxy s8', CAST(1200.00 AS Decimal(18, 2)), N'Samsung galaxy s8', NULL, 4317, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (13, CAST(N'2020-06-28T15:23:04.2331526' AS DateTime2), CAST(N'2020-07-01T21:31:59.4722111' AS DateTime2), NULL, 0, 1, N'Samsung galaxy s9', CAST(2000.00 AS Decimal(18, 2)), N'Samsung galaxy s9', NULL, 4228, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (14, CAST(N'2020-06-28T15:23:15.1798616' AS DateTime2), CAST(N'2020-07-01T21:27:40.9844163' AS DateTime2), NULL, 0, 1, N'Samsung galaxy s10', CAST(2500.00 AS Decimal(18, 2)), N'Samsung galaxy s10', NULL, 2430, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (15, CAST(N'2020-06-28T15:23:52.9143706' AS DateTime2), CAST(N'2020-07-01T21:33:44.2588613' AS DateTime2), NULL, 0, 1, N'audi', CAST(25000.00 AS Decimal(18, 2)), N'audi', NULL, 227, 7)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (16, CAST(N'2020-06-28T15:24:04.4235514' AS DateTime2), CAST(N'2020-07-01T21:31:52.7846258' AS DateTime2), NULL, 0, 1, N'vw', CAST(15000.00 AS Decimal(18, 2)), N'golf', NULL, 4318, 7)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (17, CAST(N'2020-06-28T15:24:17.1339852' AS DateTime2), NULL, NULL, 0, 1, N'bmw', CAST(150000.00 AS Decimal(18, 2)), N'bmw', NULL, 0, 7)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (18, CAST(N'2020-07-01T21:23:45.5204915' AS DateTime2), CAST(N'2020-07-01T21:33:49.0338143' AS DateTime2), NULL, 0, 1, N' Alcatel', CAST(7200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 222, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (19, CAST(N'2020-07-01T21:24:06.8808143' AS DateTime2), CAST(N'2020-07-01T21:26:25.2915517' AS DateTime2), NULL, 0, 1, N' Sony', CAST(7200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 1220, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (20, CAST(N'2020-07-01T21:24:15.0551885' AS DateTime2), CAST(N'2020-07-01T21:26:11.0709945' AS DateTime2), NULL, 0, 1, N'Note 10', CAST(200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 2430, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (21, CAST(N'2020-07-01T21:24:23.1373349' AS DateTime2), CAST(N'2020-07-01T21:31:34.3011182' AS DateTime2), NULL, 0, 1, N'Samsung a 50', CAST(2200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 2127, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (22, CAST(N'2020-07-01T21:24:32.5249950' AS DateTime2), CAST(N'2020-07-01T21:25:40.2880016' AS DateTime2), NULL, 0, 1, N'Nokia 3350', CAST(200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 2000, 5)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Cena], [Opis], [Slika], [Kolicina], [KategorijaId]) VALUES (23, CAST(N'2020-07-01T21:24:47.6710123' AS DateTime2), CAST(N'2020-07-01T21:31:23.9471619' AS DateTime2), NULL, 0, 1, N'Iphone 2 ', CAST(222200.00 AS Decimal(18, 2)), N'Nokia 4329', NULL, 997, 5)
SET IDENTITY_INSERT [dbo].[Proizvodi] OFF
GO
SET IDENTITY_INSERT [dbo].[StavkePorudzbine] ON 

INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (1, CAST(N'2020-06-24T12:41:07.5911174' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 1, 1, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (2, CAST(N'2020-06-24T12:43:23.2142518' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 4, 2, 1, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (3, CAST(N'2020-06-28T15:32:50.6091406' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 1, 3, 1, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (4, CAST(N'2020-06-28T15:35:22.6935648' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 1, 4, 1, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (5, CAST(N'2020-07-01T21:31:12.7630924' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 1, 5, 1, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (6, CAST(N'2020-07-01T21:31:23.9471615' AS DateTime2), NULL, NULL, 0, 1, N'Iphone 2 ', 3, 6, 23, CAST(222200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (7, CAST(N'2020-07-01T21:31:34.3011170' AS DateTime2), NULL, NULL, 0, 1, N'Samsung a 50', 3, 7, 21, CAST(2200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (8, CAST(N'2020-07-01T21:31:44.2740686' AS DateTime2), NULL, NULL, 0, 1, N' Alcatel', 2, 8, 18, CAST(7200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (9, CAST(N'2020-07-01T21:31:52.7846253' AS DateTime2), NULL, NULL, 0, 1, N'vw', 2, 9, 16, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (10, CAST(N'2020-07-01T21:31:59.4722107' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s9', 2, 10, 13, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (11, CAST(N'2020-07-01T21:32:24.8799522' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s7', 2, 11, 11, CAST(700.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (12, CAST(N'2020-07-01T21:32:37.9123972' AS DateTime2), NULL, NULL, 0, 1, N'Samsung ', 2, 12, 7, CAST(5220.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (13, CAST(N'2020-07-01T21:33:01.8858893' AS DateTime2), NULL, NULL, 0, 1, N'Iphone X', 1, 13, 9, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (14, CAST(N'2020-07-01T21:33:13.3704959' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s6', 1, 14, 10, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (15, CAST(N'2020-07-01T21:33:26.9478335' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s7', 3, 15, 11, CAST(700.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (16, CAST(N'2020-07-01T21:33:31.3304729' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s8', 3, 16, 12, CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (17, CAST(N'2020-07-01T21:33:44.2588607' AS DateTime2), NULL, NULL, 0, 1, N'audi', 3, 17, 15, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (18, CAST(N'2020-07-01T21:33:48.4015431' AS DateTime2), NULL, NULL, 0, 1, N' Alcatel', 3, 18, 18, CAST(7200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (19, CAST(N'2020-07-01T21:33:49.0338139' AS DateTime2), NULL, NULL, 0, 1, N' Alcatel', 3, 19, 18, CAST(7200.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (20, CAST(N'2020-07-01T21:33:53.3567105' AS DateTime2), NULL, NULL, 0, 1, N'Proizvod 1 ', 3, 20, 1, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[StavkePorudzbine] ([Id], [CreatedAt], [ModifiedAt], [DeletedAt], [IsDeleted], [IsActive], [Naziv], [Kolicina], [PorudzbinaId], [ProizvodId], [Cena]) VALUES (21, CAST(N'2020-07-01T21:34:14.5798442' AS DateTime2), NULL, NULL, 0, 1, N'Samsung galaxy s6', 1, 21, 10, CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[StavkePorudzbine] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (1, CAST(N'2020-06-21T13:45:13.8051481' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"Prva","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (2, CAST(N'2020-06-21T13:46:56.9363886' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (3, CAST(N'2020-06-21T13:47:10.9267423' AS DateTime2), N'Dohvatanje grupe po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (4, CAST(N'2020-06-21T13:47:19.4860598' AS DateTime2), N'Update Grupe', N'{"Id":1,"Naziv":"Prva update","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (5, CAST(N'2020-06-21T13:47:24.4992509' AS DateTime2), N'Dohvatanje grupe po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (6, CAST(N'2020-06-21T13:49:11.3396029' AS DateTime2), N'Dohvatanje grupe po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (7, CAST(N'2020-06-21T13:49:16.8494122' AS DateTime2), N'Brisanje grupe', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (8, CAST(N'2020-06-21T13:49:20.3182300' AS DateTime2), N'Dohvatanje grupe po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (9, CAST(N'2020-06-21T13:50:27.3056971' AS DateTime2), N'Brisanje grupe', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (10, CAST(N'2020-06-21T13:54:08.7121399' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (11, CAST(N'2020-06-21T14:03:52.2821399' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (12, CAST(N'2020-06-21T14:06:28.8430622' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (13, CAST(N'2020-06-21T14:07:41.2737757' AS DateTime2), N'Dohvatanje grupe po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (14, CAST(N'2020-06-21T14:09:12.6745419' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"Druga","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (15, CAST(N'2020-06-21T14:09:30.5234824' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (16, CAST(N'2020-06-21T14:09:42.9131303' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Druga update","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (17, CAST(N'2020-06-21T14:09:46.1350320' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (18, CAST(N'2020-06-21T15:37:58.1631371' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":null,"StavkePorudzbine":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (19, CAST(N'2020-06-21T15:57:24.4198095' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":null,"StavkePorudzbine":null}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (20, CAST(N'2020-06-21T16:04:30.5508557' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (21, CAST(N'2020-06-21T16:05:14.1943006' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (22, CAST(N'2020-06-21T16:06:03.0432619' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":1}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (23, CAST(N'2020-06-21T16:11:55.9822427' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":0}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (24, CAST(N'2020-06-21T16:21:38.9181526' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-06-22T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":0}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (25, CAST(N'2020-06-22T12:03:00.8453240' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (26, CAST(N'2020-06-22T12:03:12.5003222' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (27, CAST(N'2020-06-22T12:03:49.5533385' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Druga grupa korisnika","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (28, CAST(N'2020-06-22T12:03:52.8331168' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (29, CAST(N'2020-06-22T12:04:02.4840416' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"Treca grupa korisnika","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (30, CAST(N'2020-06-22T12:04:06.1668310' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (31, CAST(N'2020-06-22T12:04:18.4681144' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":1,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (32, CAST(N'2020-06-22T12:04:26.2726316' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":1,"Page":2}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (33, CAST(N'2020-06-22T12:04:28.9702734' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":1,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (34, CAST(N'2020-06-22T12:08:36.1974000' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Druga grupa update","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (35, CAST(N'2020-06-22T12:08:40.3249056' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (36, CAST(N'2020-06-22T12:09:38.8392145' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Druga grupa update2","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (37, CAST(N'2020-06-22T12:10:30.2889159' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (38, CAST(N'2020-06-22T12:12:08.3818958' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Druga grupa update23","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (39, CAST(N'2020-06-22T12:13:32.0113422' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (40, CAST(N'2020-06-22T12:21:52.1270769' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"Grupa 4","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (41, CAST(N'2020-06-22T12:21:56.0743054' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (42, CAST(N'2020-06-22T12:23:24.8423245' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (43, CAST(N'2020-06-22T12:23:39.1976914' AS DateTime2), N'Update Grupe', N'{"Id":2,"Naziv":"Grupa 2","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (44, CAST(N'2020-06-22T12:23:56.8918893' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (45, CAST(N'2020-06-22T12:29:32.1567451' AS DateTime2), N'Brisanje grupe', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (46, CAST(N'2020-06-22T12:29:38.7902085' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (47, CAST(N'2020-06-22T12:37:49.1760602' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (48, CAST(N'2020-06-22T12:38:01.1240246' AS DateTime2), N'Update Grupe', N'{"Id":3,"Naziv":"Grupa 3 updt","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (49, CAST(N'2020-06-22T12:38:10.2911236' AS DateTime2), N'Dohvatanje grupe po id-u', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (50, CAST(N'2020-06-23T12:52:31.9282960' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"Kategorija1","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (51, CAST(N'2020-06-23T13:00:37.6631487' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (52, CAST(N'2020-06-23T13:06:59.2085232' AS DateTime2), N'Dohvatanje kategorije', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (53, CAST(N'2020-06-23T13:07:03.7095424' AS DateTime2), N'Dohvatanje kategorije', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (54, CAST(N'2020-06-23T14:21:32.5663191' AS DateTime2), N'Update Kategorije', N'{"Id":1,"Naziv":"Kategorija Update","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (55, CAST(N'2020-06-23T14:21:37.4919972' AS DateTime2), N'Dohvatanje kategorije', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (56, CAST(N'2020-06-23T14:30:14.2333935' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (57, CAST(N'2020-06-23T14:30:23.3939089' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"Kategorija 2","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (58, CAST(N'2020-06-23T14:30:27.0235044' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"Kategorija 3","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (59, CAST(N'2020-06-23T14:30:31.5048062' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"Kategorija 4","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (60, CAST(N'2020-06-23T14:30:33.9951845' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (61, CAST(N'2020-06-23T14:30:39.7865387' AS DateTime2), N'Brisanje kategorije', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (62, CAST(N'2020-06-23T14:30:46.7539860' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (63, CAST(N'2020-06-23T14:30:50.2327139' AS DateTime2), N'Dohvatanje kategorije', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (64, CAST(N'2020-06-23T14:30:53.1934796' AS DateTime2), N'Dohvatanje kategorije', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (65, CAST(N'2020-06-23T14:31:02.1496096' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (66, CAST(N'2020-06-23T14:31:10.8784412' AS DateTime2), N'Brisanje kategorije', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (67, CAST(N'2020-06-23T14:31:20.6362941' AS DateTime2), N'Brisanje kategorije', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (68, CAST(N'2020-06-23T14:31:27.7070652' AS DateTime2), N'Dohvatanje kategorije', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (69, CAST(N'2020-06-23T14:32:18.8188348' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (70, CAST(N'2020-06-23T14:35:43.9048028' AS DateTime2), N'Brisanje kategorije', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (71, CAST(N'2020-06-23T14:36:14.6535833' AS DateTime2), N'Brisanje kategorije', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (72, CAST(N'2020-06-23T14:38:28.2658363' AS DateTime2), N'Brisanje kategorije', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (73, CAST(N'2020-06-23T14:38:35.0095848' AS DateTime2), N'Dohvatanje kategorije', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (74, CAST(N'2020-06-23T14:38:42.0854370' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (75, CAST(N'2020-06-23T15:53:14.2720495' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (76, CAST(N'2020-06-23T15:55:31.4710538' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":"stele","Ime":"Stefan","Prezime":"Stankovic","Lozinka":"sifra123","Email":"stefan.stankovic.97.16@ict.edu.rs","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (77, CAST(N'2020-06-23T15:55:55.6829775' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":"stele","Ime":"Stefan","Prezime":"Stankovic","Lozinka":"sifra123","Email":"stefan.stankovic.97.16@ict.edu.rs","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (78, CAST(N'2020-06-23T15:57:08.8044894' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"prva grupa","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (79, CAST(N'2020-06-23T15:57:11.9224395' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (80, CAST(N'2020-06-23T15:57:32.4038215' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":"stele","Ime":"Stefan","Prezime":"Stankovic","Lozinka":"sifra123","Email":"stefan.stankovic.97.16@ict.edu.rs","CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (81, CAST(N'2020-06-23T16:00:18.6141334' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":"stele","Ime":"Stefan","Prezime":"Stankovic","Lozinka":"sifra123","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (82, CAST(N'2020-06-23T16:00:41.4923149' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (83, CAST(N'2020-06-23T16:14:52.0502277' AS DateTime2), N'Dohvatanje korisnika po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (84, CAST(N'2020-06-23T16:15:27.3494086' AS DateTime2), N'Dohvatanje korisnika po id-u', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (85, CAST(N'2020-06-23T16:15:47.8905695' AS DateTime2), N'Dohvatanje korisnika po id-u', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (86, CAST(N'2020-06-23T16:16:01.9117934' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (87, CAST(N'2020-06-23T16:16:11.2919559' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (88, CAST(N'2020-06-23T16:55:19.5361200' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (89, CAST(N'2020-06-23T16:55:51.4876594' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":null,"Ime":"Stefan update","Prezime":null,"Email":null,"GrupaId":0,"Lozinka":null,"StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (90, CAST(N'2020-06-23T16:56:08.8939705' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":null,"Ime":"Stefan update","Prezime":null,"Email":null,"GrupaId":0,"Lozinka":null,"StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (91, CAST(N'2020-06-23T16:56:44.6840022' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (92, CAST(N'2020-06-23T16:57:12.0438557' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"stele","Ime":"Stefan update","Prezime":"Stankovic","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"sifra1","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (93, CAST(N'2020-06-23T16:57:15.3200941' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (94, CAST(N'2020-06-23T17:08:09.5494166' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (95, CAST(N'2020-06-23T17:08:24.8265823' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":1,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (96, CAST(N'2020-06-23T17:08:58.9056572' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":1,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (97, CAST(N'2020-06-23T17:15:42.4236256' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"stele","Ime":"Stefan update1","Prezime":"Stankovic","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"sifra1","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (98, CAST(N'2020-06-23T17:15:58.4565815' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (99, CAST(N'2020-06-23T17:16:45.7890937' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"stele","Ime":"Stefan update2","Prezime":"Stankovic","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"sifra1243","StavkePorudzbine":[]}', N'Anonymus')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (100, CAST(N'2020-06-23T17:17:15.6241880' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (101, CAST(N'2020-06-23T17:17:22.6115649' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (102, CAST(N'2020-06-23T17:17:45.8212144' AS DateTime2), N'Dohvatanje korisnika po id-u', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (103, CAST(N'2020-06-23T17:17:51.3165513' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (104, CAST(N'2020-06-23T17:25:41.5113656' AS DateTime2), N'Registracija novog korisnika', N'{"Id":4,"KorisnickoIme":"stele123","Ime":"Stefan","Prezime":"Stankovic","Lozinka":"sifra1243","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (105, CAST(N'2020-06-23T17:25:54.2289242' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (106, CAST(N'2020-06-23T17:26:34.0399757' AS DateTime2), N'Brisanje grupe', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (107, CAST(N'2020-06-23T17:26:39.3540132' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (108, CAST(N'2020-06-23T17:26:48.3681738' AS DateTime2), N'Dohvatanje korisnika po id-u', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (109, CAST(N'2020-06-23T17:27:34.7677028' AS DateTime2), N'Brisanje korisnika', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (110, CAST(N'2020-06-23T17:27:39.2675579' AS DateTime2), N'Dohvatanje korisnika po id-u', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (111, CAST(N'2020-06-23T17:27:51.4560145' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (112, CAST(N'2020-06-23T17:47:19.5682138' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (113, CAST(N'2020-06-23T17:49:20.7128450' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (114, CAST(N'2020-06-23T18:09:40.0900810' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (115, CAST(N'2020-06-23T18:12:33.4633975' AS DateTime2), N'Kreiranje proizvoda', N'{"Naziv":"Proizvod 1","Cena":0.0,"Opis":null,"Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (116, CAST(N'2020-06-23T18:13:03.9181133' AS DateTime2), N'Kreiranje proizvoda', N'{"Naziv":"Proizvod 1","Cena":500.0,"Opis":"neki moj opis","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (117, CAST(N'2020-06-23T18:13:12.9184540' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (118, CAST(N'2020-06-24T07:28:05.4247762' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (119, CAST(N'2020-06-24T07:28:23.8262853' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Proizvod 2","Cena":800.0,"Opis":"neki moj opis 2","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (120, CAST(N'2020-06-24T07:28:40.0543487' AS DateTime2), N'Update proizvoda', N'{"Id":1,"Naziv":"Proizvod 2","Cena":800.0,"Opis":"neki moj opis 2","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (121, CAST(N'2020-06-24T07:28:57.8375904' AS DateTime2), N'Update proizvoda', N'{"Id":1,"Naziv":"Proizvod 1","Cena":900.0,"Opis":"neki moj opis 2","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (122, CAST(N'2020-06-24T07:29:09.3621622' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (123, CAST(N'2020-06-24T07:29:30.1637822' AS DateTime2), N'Update proizvoda', N'{"Id":1,"Naziv":"Proizvod 1 ","Cena":900.0,"Opis":"neki moj opis","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (124, CAST(N'2020-06-24T07:36:01.4497856' AS DateTime2), N'Update proizvoda', N'{"Id":1,"Naziv":"Proizvod 1 ","Cena":900.0,"Opis":"neki moj opis","Slika":null,"Kolicina":0,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (125, CAST(N'2020-06-24T07:36:07.9867608' AS DateTime2), N'Dohvatanje proizvoda po idu', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (126, CAST(N'2020-06-24T07:37:02.8651786' AS DateTime2), N'Dohvatanje proizvoda po idu', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (127, CAST(N'2020-06-24T07:37:18.7586847' AS DateTime2), N'Update proizvoda', N'{"Id":1,"Naziv":"Proizvod 1 ","Cena":900.0,"Opis":"neki moj opis","Slika":null,"Kolicina":1000,"KategorijaId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (128, CAST(N'2020-06-24T07:37:21.1309149' AS DateTime2), N'Dohvatanje proizvoda po idu', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (129, CAST(N'2020-06-24T07:45:29.3300497' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (130, CAST(N'2020-06-24T07:45:55.6942335' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (131, CAST(N'2020-06-24T07:46:03.6952623' AS DateTime2), N'Brisanje proizvoda', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (132, CAST(N'2020-06-24T07:46:08.5348105' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (133, CAST(N'2020-06-24T07:46:11.9922938' AS DateTime2), N'Dohvatanje proizvoda po idu', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (134, CAST(N'2020-06-24T07:59:02.0698080' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (135, CAST(N'2020-06-24T08:12:59.6300498' AS DateTime2), N'Update korisnika', N'{"Id":5,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (136, CAST(N'2020-06-24T08:13:37.7571740' AS DateTime2), N'Update korisnika', N'{"Id":5,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","StavkePorudzbine":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (137, CAST(N'2020-06-24T08:20:10.9746318' AS DateTime2), N'Update korisnika', N'{"Id":5,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (138, CAST(N'2020-06-24T08:20:31.2092565' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (139, CAST(N'2020-06-24T08:29:51.3441227' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (140, CAST(N'2020-06-24T08:29:58.9620890' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (141, CAST(N'2020-06-24T08:37:32.7135224' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (142, CAST(N'2020-06-24T08:38:01.3946542' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (143, CAST(N'2020-06-24T08:38:19.1137764' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (144, CAST(N'2020-06-24T08:39:24.8455701' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (145, CAST(N'2020-06-24T08:44:32.1530395' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (146, CAST(N'2020-06-24T08:47:09.4632746' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[{"Id":0,"Usecase":0},{"Id":4,"Usecase":0},{"Id":4,"Usecase":0}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (147, CAST(N'2020-06-24T08:50:01.1824369' AS DateTime2), N'Update korisnika', N'{"Id":4,"KorisnickoIme":"admin","Ime":"admin","Prezime":"admin","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":5,"Lozinka":"admin123","KorisnikUseCase":[{"Id":0,"Usecase":0},{"Id":4,"Usecase":2},{"Id":4,"Usecase":3}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (148, CAST(N'2020-06-24T09:25:45.5814850' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":null,"CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (149, CAST(N'2020-06-24T10:38:47.5486141' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":2,"Naziv":null}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (150, CAST(N'2020-06-24T10:40:19.6595368' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":2,"Naziv":null}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (151, CAST(N'2020-06-24T10:41:06.5375035' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (152, CAST(N'2020-06-24T10:43:22.1399217' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":4,"Naziv":null}]}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (153, CAST(N'2020-06-24T12:26:52.8699667' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (154, CAST(N'2020-06-24T13:49:22.8583952' AS DateTime2), N'Dohvatanje porudzbine po idu', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (155, CAST(N'2020-06-24T13:49:27.8556205' AS DateTime2), N'Dohvatanje porudzbine po idu', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (156, CAST(N'2020-06-24T14:20:49.0215518' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":null,"CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (157, CAST(N'2020-06-24T14:59:05.8244671' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (158, CAST(N'2020-06-28T12:31:47.7020072' AS DateTime2), N'Dohvatanje grupe po id-u', N'2', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (159, CAST(N'2020-06-28T12:33:16.3002135' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (160, CAST(N'2020-06-28T12:33:23.8380716' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (161, CAST(N'2020-06-28T12:46:53.8598444' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (162, CAST(N'2020-06-28T12:46:58.0547156' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":null,"CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (163, CAST(N'2020-06-28T12:47:16.6991698' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"Moja grupa","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (164, CAST(N'2020-06-28T12:47:21.6233912' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (165, CAST(N'2020-06-28T12:49:00.2370792' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (166, CAST(N'2020-06-28T12:52:14.1267618' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (167, CAST(N'2020-06-28T12:52:44.3418417' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (168, CAST(N'2020-06-28T12:53:39.6286513' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (169, CAST(N'2020-06-28T12:55:32.3542859' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (170, CAST(N'2020-06-28T12:56:42.7135635' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (171, CAST(N'2020-06-28T12:56:49.8741770' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (172, CAST(N'2020-06-28T12:56:54.0730322' AS DateTime2), N'Dohvatanje proizvoda po idu', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (173, CAST(N'2020-06-28T12:57:48.2122615' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (174, CAST(N'2020-06-28T12:58:00.7614425' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (175, CAST(N'2020-06-28T12:59:11.0895488' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (176, CAST(N'2020-06-28T12:59:30.8181469' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (177, CAST(N'2020-06-28T13:02:43.6036360' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (178, CAST(N'2020-06-28T13:02:52.4029857' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (179, CAST(N'2020-06-28T13:04:28.2296580' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":100,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (180, CAST(N'2020-06-28T13:04:42.6390412' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":100,"Page":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (181, CAST(N'2020-06-28T13:10:38.5997424' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (182, CAST(N'2020-06-28T13:12:38.0607419' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (183, CAST(N'2020-06-28T13:13:13.8752053' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Proizvod 2 ","Cena":1900.00,"Opis":"neki moj opis 2","Slika":null,"Kolicina":9295,"KategorijaId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (184, CAST(N'2020-06-28T13:13:25.1217362' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Proizvod 2 ","Cena":1900.00,"Opis":"neki moj opis 2","Slika":null,"Kolicina":9295,"KategorijaId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (185, CAST(N'2020-06-28T13:14:01.7234266' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Proizvod 4","Cena":1900.00,"Opis":"neki moj opis 2","Slika":null,"Kolicina":9295,"KategorijaId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (186, CAST(N'2020-06-28T13:14:16.1422753' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Proizvod 5","Cena":300.00,"Opis":"neki moj opis 3","Slika":null,"Kolicina":295,"KategorijaId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (187, CAST(N'2020-06-28T13:14:46.0351986' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (188, CAST(N'2020-06-28T13:15:05.5188688' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (189, CAST(N'2020-06-28T13:15:19.0074471' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (190, CAST(N'2020-06-28T13:15:29.7805369' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (191, CAST(N'2020-06-28T13:15:43.4142986' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (192, CAST(N'2020-06-28T13:15:49.4181017' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung ","Cena":5220.00,"Opis":"Telefon samsung","Slika":null,"Kolicina":225,"KategorijaId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (193, CAST(N'2020-06-28T13:15:57.6560341' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (194, CAST(N'2020-06-28T13:16:19.4892648' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (195, CAST(N'2020-06-28T13:16:25.6791920' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"Telefon ","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (196, CAST(N'2020-06-28T13:16:30.5671740' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"patike ","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (197, CAST(N'2020-06-28T13:16:36.9585400' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"automobil ","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (198, CAST(N'2020-06-28T13:16:40.6550575' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (199, CAST(N'2020-06-28T13:16:52.9938972' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (200, CAST(N'2020-06-28T13:17:01.9666588' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (201, CAST(N'2020-06-28T13:17:18.3904553' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (202, CAST(N'2020-06-28T13:17:43.8510838' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (203, CAST(N'2020-06-28T13:18:47.4565325' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Nokia","Cena":900.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":995,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (204, CAST(N'2020-06-28T13:18:50.6951971' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (205, CAST(N'2020-06-28T13:19:35.6384610' AS DateTime2), N'Prikaz svih korisnika', N'{"Ime":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (206, CAST(N'2020-06-28T13:21:42.3116294' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (207, CAST(N'2020-06-28T13:22:15.8314243' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Iphone X","Cena":2000.00,"Opis":"Iphone X","Slika":null,"Kolicina":95,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (208, CAST(N'2020-06-28T13:22:33.9327979' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung galaxy s6","Cena":500.00,"Opis":"Samsung galaxy s6","Slika":null,"Kolicina":95,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (209, CAST(N'2020-06-28T13:22:44.1717646' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung galaxy s7","Cena":700.00,"Opis":"Samsung galaxy s7","Slika":null,"Kolicina":195,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (210, CAST(N'2020-06-28T13:22:55.2435332' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung galaxy s8","Cena":1200.00,"Opis":"Samsung galaxy s8","Slika":null,"Kolicina":195,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (211, CAST(N'2020-06-28T13:23:04.2309780' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung galaxy s9","Cena":2000.00,"Opis":"Samsung galaxy s9","Slika":null,"Kolicina":195,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (212, CAST(N'2020-06-28T13:23:15.1774690' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung galaxy s10","Cena":2500.00,"Opis":"Samsung galaxy s10","Slika":null,"Kolicina":195,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (213, CAST(N'2020-06-28T13:23:17.2988958' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (214, CAST(N'2020-06-28T13:23:28.8731663' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (215, CAST(N'2020-06-28T13:23:52.9104336' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"audi","Cena":25000.00,"Opis":"audi","Slika":null,"Kolicina":195,"KategorijaId":7}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (216, CAST(N'2020-06-28T13:24:04.4217158' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"vw","Cena":15000.00,"Opis":"golf","Slika":null,"Kolicina":195,"KategorijaId":7}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (217, CAST(N'2020-06-28T13:24:17.1323473' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"bmw","Cena":150000.00,"Opis":"bmw","Slika":null,"Kolicina":195,"KategorijaId":7}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (218, CAST(N'2020-06-28T13:24:31.0719837' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":null,"StavkePorudzbine":[]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (219, CAST(N'2020-06-28T13:26:08.2295517' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":15,"Kolicina":0,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (220, CAST(N'2020-06-28T13:26:24.6070196' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":15,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (221, CAST(N'2020-06-28T13:27:17.7725400' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (222, CAST(N'2020-06-28T13:27:26.5313699' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (223, CAST(N'2020-06-28T13:29:06.1097997' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"0001-01-01T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (224, CAST(N'2020-06-28T13:32:48.2495517' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (225, CAST(N'2020-06-28T13:33:19.7148594' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (226, CAST(N'2020-06-28T13:35:02.6998213' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":"kr","PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (227, CAST(N'2020-06-28T13:35:21.8981364' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (228, CAST(N'2020-06-28T13:35:26.3503002' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (229, CAST(N'2020-06-28T13:35:34.4177880' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":"ust","PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (230, CAST(N'2020-06-28T13:36:29.4288192' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (231, CAST(N'2020-06-28T13:37:01.1589887' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (232, CAST(N'2020-06-28T13:39:10.9774417' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":null,"Ime":null,"Prezime":null,"Lozinka":null,"Email":null,"GrupaId":0,"CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (233, CAST(N'2020-06-28T13:40:48.9558694' AS DateTime2), N'Registracija novog korisnika', N'{"Id":0,"KorisnickoIme":"miki123","Ime":"Mika","Prezime":"Jovanovic","Lozinka":"sifra123","Email":"stefan.stankovic.97.16@ict.edu.rs","GrupaId":4,"CreatedAd":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAd":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (234, CAST(N'2020-06-28T13:41:46.9322715' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"odeca","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (235, CAST(N'2020-06-28T13:42:02.0572408' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (236, CAST(N'2020-06-28T13:42:31.6459478' AS DateTime2), N'Dohvatanje kategorije', N'4', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (237, CAST(N'2020-07-01T19:18:41.5254335' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":null,"CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (238, CAST(N'2020-07-01T19:18:47.8053626' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (239, CAST(N'2020-07-01T19:19:05.6156484' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (240, CAST(N'2020-07-01T19:19:54.8094631' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (241, CAST(N'2020-07-01T19:20:13.0387944' AS DateTime2), N'Dohvatanje proizvoda po idu', N'9', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (242, CAST(N'2020-07-01T19:20:26.3917195' AS DateTime2), N'Update proizvoda', N'{"Id":9,"Naziv":null,"Cena":0.0,"Opis":null,"Slika":null,"Kolicina":1000,"KategorijaId":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (243, CAST(N'2020-07-01T19:20:35.5171058' AS DateTime2), N'Update proizvoda', N'{"Id":9,"Naziv":"Iphone X","Cena":2000.00,"Opis":"Iphone X","Slika":null,"Kolicina":1900,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (244, CAST(N'2020-07-01T19:20:38.9291254' AS DateTime2), N'Dohvatanje proizvoda po idu', N'9', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (245, CAST(N'2020-07-01T19:20:47.2614954' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (246, CAST(N'2020-07-01T19:21:12.7740739' AS DateTime2), N'Dohvatanje proizvoda po idu', N'7', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (247, CAST(N'2020-07-01T19:21:16.9321483' AS DateTime2), N'Update proizvoda', N'{"Id":7,"Naziv":"Samsung ","Cena":5220.00,"Opis":"Telefon samsung","Slika":null,"Kolicina":1000,"KategorijaId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (248, CAST(N'2020-07-01T19:21:25.5299619' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (249, CAST(N'2020-07-01T19:21:43.3116235' AS DateTime2), N'Update proizvoda', N'{"Id":9,"Naziv":"Nokia","Cena":900.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (250, CAST(N'2020-07-01T19:22:00.1456935' AS DateTime2), N'Update proizvoda', N'{"Id":9,"Naziv":"Nokia","Cena":900.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (251, CAST(N'2020-07-01T19:22:35.1899183' AS DateTime2), N'Dohvatanje proizvoda po idu', N'8', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (252, CAST(N'2020-07-01T19:22:38.9131090' AS DateTime2), N'Update proizvoda', N'{"Id":8,"Naziv":"Nokia","Cena":900.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (253, CAST(N'2020-07-01T19:23:23.5051757' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (254, CAST(N'2020-07-01T19:23:45.5054534' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":" Alcatel","Cena":7200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (255, CAST(N'2020-07-01T19:23:50.5532541' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (256, CAST(N'2020-07-01T19:23:55.1373757' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (257, CAST(N'2020-07-01T19:24:06.8755370' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":" Sony","Cena":7200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (258, CAST(N'2020-07-01T19:24:15.0469137' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Note 10","Cena":200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (259, CAST(N'2020-07-01T19:24:23.1321952' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Samsung a 50","Cena":2200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (260, CAST(N'2020-07-01T19:24:32.5218051' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Nokia 3350","Cena":200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (261, CAST(N'2020-07-01T19:24:47.6636073' AS DateTime2), N'Kreiranje proizvoda', N'{"Id":0,"Naziv":"Iphone 2 ","Cena":222200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (262, CAST(N'2020-07-01T19:24:53.4842934' AS DateTime2), N'Prikaz svih proizvoda', N'{"Naziv":null,"PerPage":10,"Page":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (263, CAST(N'2020-07-01T19:25:26.8369241' AS DateTime2), N'Update proizvoda', N'{"Id":23,"Naziv":"Iphone 2 ","Cena":222200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (264, CAST(N'2020-07-01T19:25:32.0806680' AS DateTime2), N'Dohvatanje proizvoda po idu', N'22', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (265, CAST(N'2020-07-01T19:25:40.2805821' AS DateTime2), N'Update proizvoda', N'{"Id":22,"Naziv":"Nokia 3350","Cena":200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":2000,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (266, CAST(N'2020-07-01T19:25:44.9161335' AS DateTime2), N'Dohvatanje proizvoda po idu', N'21', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (267, CAST(N'2020-07-01T19:25:57.3256684' AS DateTime2), N'Update proizvoda', N'{"Id":21,"Naziv":"Samsung a 50","Cena":2200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":2130,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (268, CAST(N'2020-07-01T19:26:02.9071697' AS DateTime2), N'Dohvatanje proizvoda po idu', N'20', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (269, CAST(N'2020-07-01T19:26:11.0668271' AS DateTime2), N'Update proizvoda', N'{"Id":20,"Naziv":"Note 10","Cena":200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":2430,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (270, CAST(N'2020-07-01T19:26:15.6911474' AS DateTime2), N'Dohvatanje proizvoda po idu', N'19', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (271, CAST(N'2020-07-01T19:26:21.9867227' AS DateTime2), N'Dohvatanje proizvoda po idu', N'19', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (272, CAST(N'2020-07-01T19:26:25.2878763' AS DateTime2), N'Update proizvoda', N'{"Id":19,"Naziv":" Sony","Cena":7200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":1220,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (273, CAST(N'2020-07-01T19:26:29.5088856' AS DateTime2), N'Dohvatanje proizvoda po idu', N'18', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (274, CAST(N'2020-07-01T19:26:35.6872555' AS DateTime2), N'Dohvatanje proizvoda po idu', N'18', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (275, CAST(N'2020-07-01T19:26:40.4411246' AS DateTime2), N'Update proizvoda', N'{"Id":18,"Naziv":" Alcatel","Cena":7200.00,"Opis":"Nokia 4329","Slika":null,"Kolicina":230,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (276, CAST(N'2020-07-01T19:26:44.7640879' AS DateTime2), N'Dohvatanje proizvoda po idu', N'17', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (277, CAST(N'2020-07-01T19:26:53.0763685' AS DateTime2), N'Dohvatanje proizvoda po idu', N'17', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (278, CAST(N'2020-07-01T19:27:03.8965838' AS DateTime2), N'Dohvatanje proizvoda po idu', N'16', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (279, CAST(N'2020-07-01T19:27:15.7381420' AS DateTime2), N'Update proizvoda', N'{"Id":16,"Naziv":"vw","Cena":15000.00,"Opis":"golf","Slika":null,"Kolicina":4320,"KategorijaId":7}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (280, CAST(N'2020-07-01T19:27:20.5532737' AS DateTime2), N'Dohvatanje proizvoda po idu', N'15', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (281, CAST(N'2020-07-01T19:27:28.5229312' AS DateTime2), N'Update proizvoda', N'{"Id":15,"Naziv":"audi","Cena":25000.00,"Opis":"audi","Slika":null,"Kolicina":230,"KategorijaId":7}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (282, CAST(N'2020-07-01T19:27:33.2107671' AS DateTime2), N'Dohvatanje proizvoda po idu', N'14', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (283, CAST(N'2020-07-01T19:27:40.9808708' AS DateTime2), N'Update proizvoda', N'{"Id":14,"Naziv":"Samsung galaxy s10","Cena":2500.00,"Opis":"Samsung galaxy s10","Slika":null,"Kolicina":2430,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (284, CAST(N'2020-07-01T19:27:45.3518844' AS DateTime2), N'Dohvatanje proizvoda po idu', N'13', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (285, CAST(N'2020-07-01T19:27:53.6625459' AS DateTime2), N'Update proizvoda', N'{"Id":13,"Naziv":"Samsung galaxy s9","Cena":2000.00,"Opis":"Samsung galaxy s9","Slika":null,"Kolicina":4230,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (286, CAST(N'2020-07-01T19:28:01.1955948' AS DateTime2), N'Dohvatanje proizvoda po idu', N'12', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (287, CAST(N'2020-07-01T19:28:10.6239030' AS DateTime2), N'Update proizvoda', N'{"Id":12,"Naziv":"Samsung galaxy s8","Cena":1200.00,"Opis":"Samsung galaxy s8","Slika":null,"Kolicina":4320,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (288, CAST(N'2020-07-01T19:28:14.3905245' AS DateTime2), N'Dohvatanje proizvoda po idu', N'11', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (289, CAST(N'2020-07-01T19:28:23.9025589' AS DateTime2), N'Update proizvoda', N'{"Id":11,"Naziv":"Samsung galaxy s7","Cena":700.00,"Opis":"Samsung galaxy s7","Slika":null,"Kolicina":320,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (290, CAST(N'2020-07-01T19:28:28.5014424' AS DateTime2), N'Dohvatanje proizvoda po idu', N'10', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (291, CAST(N'2020-07-01T19:28:39.1699610' AS DateTime2), N'Update proizvoda', N'{"Id":10,"Naziv":"Samsung galaxy s6","Cena":500.00,"Opis":"Samsung galaxy s6","Slika":null,"Kolicina":4230,"KategorijaId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (292, CAST(N'2020-07-01T19:28:44.5830222' AS DateTime2), N'Dohvatanje proizvoda po idu', N'9', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (293, CAST(N'2020-07-01T19:28:55.7239336' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (294, CAST(N'2020-07-01T19:29:31.4445074' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (295, CAST(N'2020-07-01T19:29:44.5342266' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (296, CAST(N'2020-07-01T19:29:54.4774865' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (297, CAST(N'2020-07-01T19:30:31.2308966' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-10T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":0,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (298, CAST(N'2020-07-01T19:31:11.8874934' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (299, CAST(N'2020-07-01T19:31:23.3410321' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":23,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (300, CAST(N'2020-07-01T19:31:33.7089714' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":21,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (301, CAST(N'2020-07-01T19:31:43.4298216' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":18,"Kolicina":2,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (302, CAST(N'2020-07-01T19:31:52.1744128' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":16,"Kolicina":2,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (303, CAST(N'2020-07-01T19:31:58.9097761' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Kragujevacka 3","StavkePorudzbine":[{"ProizvodId":13,"Kolicina":2,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (304, CAST(N'2020-07-01T19:32:03.2132105' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (305, CAST(N'2020-07-01T19:32:24.3338625' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 18","StavkePorudzbine":[{"ProizvodId":11,"Kolicina":2,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (306, CAST(N'2020-07-01T19:32:37.3825085' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":7,"Kolicina":2,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (307, CAST(N'2020-07-01T19:32:49.0770060' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":17,"Kolicina":22,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (308, CAST(N'2020-07-01T19:33:00.2245440' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":9,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (309, CAST(N'2020-07-01T19:33:08.4470679' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":10,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (310, CAST(N'2020-07-01T19:33:17.3996634' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (311, CAST(N'2020-07-01T19:33:26.9441625' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":11,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (312, CAST(N'2020-07-01T19:33:31.3266756' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":12,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (313, CAST(N'2020-07-01T19:33:35.9796473' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":5,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (314, CAST(N'2020-07-01T19:33:44.2553986' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":15,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (315, CAST(N'2020-07-01T19:33:48.3984604' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":18,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (316, CAST(N'2020-07-01T19:33:49.0304733' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":18,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (317, CAST(N'2020-07-01T19:33:53.3535949' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":1,"Kolicina":3,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (318, CAST(N'2020-07-01T19:33:59.8616202' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":3,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (319, CAST(N'2020-07-01T19:34:07.5012471' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":6,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (320, CAST(N'2020-07-01T19:34:14.5758274' AS DateTime2), N'Pravljenje porudzbine', N'{"VremePorudzbine":"2020-07-06T00:00:00","Adresa":"Ustanicka 19","StavkePorudzbine":[{"ProizvodId":10,"Kolicina":1,"Naziv":null,"Cena":0}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (321, CAST(N'2020-07-01T19:34:17.0762914' AS DateTime2), N'Pretrazivanje porudzbina', N'{"Adresa":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (322, CAST(N'2020-07-01T19:34:33.1395324' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (323, CAST(N'2020-07-01T19:34:50.1780284' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa2","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (324, CAST(N'2020-07-01T19:34:54.4464161' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa3","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (325, CAST(N'2020-07-01T19:34:56.9741892' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa4","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (326, CAST(N'2020-07-01T19:34:59.7579838' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa5","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (327, CAST(N'2020-07-01T19:35:02.3908425' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa6","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (328, CAST(N'2020-07-01T19:35:05.1575686' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"grupa7","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (329, CAST(N'2020-07-01T19:35:09.4934112' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"asp","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (330, CAST(N'2020-07-01T19:35:12.4699061' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"php","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (331, CAST(N'2020-07-01T19:35:19.5825604' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"administratori","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (332, CAST(N'2020-07-01T19:35:25.6853452' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"obicni korisnici","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (333, CAST(N'2020-07-01T19:35:28.7397743' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"neobicni korisnici","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (334, CAST(N'2020-07-01T19:35:34.5344062' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"vanzemaljci","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (335, CAST(N'2020-07-01T19:35:38.7741115' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"komunisti","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (336, CAST(N'2020-07-01T19:35:46.3889745' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"zivotinje","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (337, CAST(N'2020-07-01T19:35:54.0871450' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"ljudi","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (338, CAST(N'2020-07-01T19:36:04.5507517' AS DateTime2), N'Dohvatanje UseCase logova', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (339, CAST(N'2020-07-01T19:36:12.7823383' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (340, CAST(N'2020-07-01T19:36:23.2065632' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"moja grupa 2","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (341, CAST(N'2020-07-01T19:36:26.5034283' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"moja grupa 3","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (342, CAST(N'2020-07-01T19:36:29.6106059' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"moja grupa 4","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (343, CAST(N'2020-07-01T19:36:32.9858218' AS DateTime2), N'Kreiranje grupe', N'{"Id":0,"Naziv":"moja grupa 5","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (344, CAST(N'2020-07-01T19:36:35.2197229' AS DateTime2), N'Pretraga grupa', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (345, CAST(N'2020-07-01T19:36:53.9242013' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (346, CAST(N'2020-07-01T19:37:11.2344196' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"zvucnici","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (347, CAST(N'2020-07-01T19:37:16.5150581' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"kompujteri","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (348, CAST(N'2020-07-01T19:37:20.0070925' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"mikseri","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (349, CAST(N'2020-07-01T19:37:24.4591527' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"usisivaci","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (350, CAST(N'2020-07-01T19:37:28.9706737' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"upaljaci","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (351, CAST(N'2020-07-01T19:37:34.3776001' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"monitori","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (352, CAST(N'2020-07-01T19:37:38.0389272' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"misevi","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (353, CAST(N'2020-07-01T19:37:41.7876066' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"tableti","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (354, CAST(N'2020-07-01T19:37:43.8760139' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (355, CAST(N'2020-07-01T19:37:51.1007644' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"ruteri","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (356, CAST(N'2020-07-01T19:37:56.6373630' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"radijatori","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (357, CAST(N'2020-07-01T19:37:59.5976925' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"stolice","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (358, CAST(N'2020-07-01T19:38:03.7716720' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"stolovi","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (359, CAST(N'2020-07-01T19:38:07.4818939' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"puske","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (360, CAST(N'2020-07-01T19:38:11.1968353' AS DateTime2), N'Kreiranje kategorije', N'{"Id":0,"Naziv":"pistolji","CreatedAt":"0001-01-01T00:00:00","ModifiedAt":null,"DeletedAt":null,"IsDeleted":false,"IsActive":false}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Datum], [UseCaseNaziv], [Data], [Actor]) VALUES (361, CAST(N'2020-07-01T19:38:13.2759296' AS DateTime2), N'Dohvatanje Kategorija', N'{"Naziv":null,"PerPage":10,"Page":1}', N'admin')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Grupe_Naziv]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Grupe_Naziv] ON [dbo].[Grupe]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Kategorije_Naziv]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Kategorije_Naziv] ON [dbo].[Kategorije]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Korisnici_GrupaId]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_Korisnici_GrupaId] ON [dbo].[Korisnici]
(
	[GrupaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Korisnici_KorisnickoIme]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Korisnici_KorisnickoIme] ON [dbo].[Korisnici]
(
	[KorisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KorisnikUseCase_KorisnikId]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_KorisnikUseCase_KorisnikId] ON [dbo].[KorisnikUseCase]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Porudzbine_KorisnikId]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_Porudzbine_KorisnikId] ON [dbo].[Porudzbine]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proizvodi_KategorijaId]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proizvodi_KategorijaId] ON [dbo].[Proizvodi]
(
	[KategorijaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Proizvodi_Naziv]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Proizvodi_Naziv] ON [dbo].[Proizvodi]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StavkePorudzbine_PorudzbinaId]    Script Date: 7/1/2020 9:41:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_StavkePorudzbine_PorudzbinaId] ON [dbo].[StavkePorudzbine]
(
	[PorudzbinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StavkePorudzbine_ProizvodId]    Script Date: 7/1/2020 9:41:15 PM ******/
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
