USE [master]
GO
/****** Object:  Database [DisneyBD]    Script Date: 30/5/2023 23:12:17 ******/
CREATE DATABASE [DisneyBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DisneyBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DisneyBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DisneyBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DisneyBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DisneyBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DisneyBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DisneyBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DisneyBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DisneyBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DisneyBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DisneyBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DisneyBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DisneyBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DisneyBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DisneyBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DisneyBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DisneyBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DisneyBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DisneyBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DisneyBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DisneyBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DisneyBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DisneyBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DisneyBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DisneyBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DisneyBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DisneyBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DisneyBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DisneyBD] SET RECOVERY FULL 
GO
ALTER DATABASE [DisneyBD] SET  MULTI_USER 
GO
ALTER DATABASE [DisneyBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DisneyBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DisneyBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DisneyBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DisneyBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DisneyBD] SET QUERY_STORE = OFF
GO
USE [DisneyBD]
GO
/****** Object:  User [Disney]    Script Date: 30/5/2023 23:12:17 ******/
CREATE USER [Disney] FOR LOGIN [Disney] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Disney]
GO
/****** Object:  Table [dbo].[PeliculaSerie]    Script Date: 30/5/2023 23:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculaSerie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](200) NULL,
	[Titulo] [varchar](50) NULL,
	[FechaCreacion] [date] NULL,
	[Calificacion] [nchar](5) NULL,
 CONSTRAINT [PK_PeliculaSerie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeliculaxPersonaje]    Script Date: 30/5/2023 23:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculaxPersonaje](
	[idPeliculaxPersonaje] [int] IDENTITY(1,1) NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idPersonaje] [int] NOT NULL,
 CONSTRAINT [PK_PeliculaxPersonaje] PRIMARY KEY CLUSTERED 
(
	[idPeliculaxPersonaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 30/5/2023 23:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](200) NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Peso] [nchar](10) NULL,
	[Historia] [varchar](max) NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeliculaSerie] ON 

INSERT [dbo].[PeliculaSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (1, N'https://static.wikia.nocookie.net/pixar/images/5/51/Toy_Story_Poster.png/revision/latest?cb=20160107180051&path-prefix=es', N'Toy Story', CAST(N'1995-11-22' AS Date), N'4.8  ')
INSERT [dbo].[PeliculaSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (2, N'https://static.wikia.nocookie.net/pixar/images/b/b6/Toy_Story_2_poster.png/revision/latest?cb=20160107182846&path-prefix=es', N'Toy Story 2', CAST(N'1999-11-24' AS Date), N'4.7  ')
INSERT [dbo].[PeliculaSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (3, N'https://static.wikia.nocookie.net/pixar/images/e/e2/Monsters_Inc_Poster.png/revision/latest?cb=20160107185450&path-prefix=es', N'Monsters, Inc.', CAST(N'2001-11-02' AS Date), N'4.7  ')
INSERT [dbo].[PeliculaSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (4, N'https://static.wikia.nocookie.net/pixar/images/b/ba/WALL-E_Poster.png/revision/latest?cb=20160107221846&path-prefix=es', N'WALL-E', CAST(N'2008-06-27' AS Date), N'4.9  ')
INSERT [dbo].[PeliculaSerie] ([Id], [Imagen], [Titulo], [FechaCreacion], [Calificacion]) VALUES (5, N'https://static.wikia.nocookie.net/pixar/images/7/76/Cars_Poster.png/revision/latest/scale-to-width-down/337?cb=20160107193502&path-prefix=es', N'Cars', CAST(N'2006-06-09' AS Date), N'4.8  ')
SET IDENTITY_INSERT [dbo].[PeliculaSerie] OFF
GO
SET IDENTITY_INSERT [dbo].[PeliculaxPersonaje] ON 

INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (1, 1, 1)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (2, 1, 2)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (3, 1, 3)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (4, 1, 6)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (5, 2, 4)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (6, 2, 5)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (7, 2, 6)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (8, 2, 1)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (9, 2, 2)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (10, 2, 3)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (11, 3, 7)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (12, 3, 8)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (13, 3, 9)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (14, 4, 10)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (15, 4, 11)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (16, 4, 12)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (17, 5, 13)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (18, 5, 14)
INSERT [dbo].[PeliculaxPersonaje] ([idPeliculaxPersonaje], [idPelicula], [idPersonaje]) VALUES (20, 5, 15)
SET IDENTITY_INSERT [dbo].[PeliculaxPersonaje] OFF
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (1, N'https://static.wikia.nocookie.net/pixar/images/e/e9/Woody_-_Imagen_promocional_de_Toy_Story_3.png/revision/latest/scale-to-width-down/350?cb=20160108135843&path-prefix=es', N'Woody', 55, N'0.2       ', N'Woody (también conocido como Comisario Woody) es el protagonista de las películas de Toy Story y es un personaje secundario en los spin-off y cortos derivados de la misma.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (2, N'https://static.wikia.nocookie.net/pixar/images/0/00/Buzz_Lightyear_-_Imagen_promocional_de_Toy_Story_3.png/revision/latest/scale-to-width-down/350?cb=20160108140543&path-prefix=es', N'Buzz Lightyear', 70, N'0.5       ', N'Buzz Lightyear es el co-protagonista de Toy Story, el tritagonista de Toy Story 2 y Toy Story 3, el protagonista titular de su serie de televisión Buzz Lightyear of Star Command, y su película directa en DVD, Buzz Lightyear of Star Command: The Adventure Begins, el protagonista del episodio Small Fry de Toy Story Toons, y un personaje secundario en otros medios de la franquicia de Toy Story, Hawaiian Vacation, Partysaurus Rex, Toy Story of Terror!, y Toy Story That Time Forgot.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (3, N'https://static.wikia.nocookie.net/pixar/images/0/07/Hamm_-_Toy_Story_3.png/revision/latest/scale-to-width-down/350?cb=20160123002514&path-prefix=es', N'Hamm', 50, N'0.7       ', N'Hamm es un personaje secundario de la franquicia Toy Story. Él es una alcancía de plástico ocurrente con un corcho en su barriga.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (4, N'https://static.wikia.nocookie.net/pixar/images/a/a3/Jessie_-_Imagen_promocional_de_Toy_Story_3.png/revision/latest/scale-to-width-down/350?cb=20160119020727&path-prefix=es', N'Jessie', 52, N'0.2       ', N'Jessie es una de las personajes introducidas en Toy Story 2. Ella es la deuteragonista de Toy Story 2 y Toy Story 3, y la protagonista de Toy Story of Terror!.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (5, N'https://static.wikia.nocookie.net/pixar/images/9/9b/5d1e388186100_324x182.jpg/revision/latest?cb=20201016035506&path-prefix=es', N'Oloroso Pete', 100, N'1         ', N'Oloroso Pete (o simplemente conocido como el Capataz) es el principal antagonista de Toy Story 2. Él es un muñeco capataz que protagonizó con Woody, Jessie y Tiro al Blanco, El Rodeo de Woody, donde parecía ser de buen corazón y agradable, pero resultó ser un villano astuto y peligroso.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (6, N'https://static.wikia.nocookie.net/pixar/images/5/5c/Cara_de_Papa_-_Toy_Story_3_promocion.png/revision/latest/scale-to-width-down/350?cb=20160115171445&path-prefix=es', N'Señor Cara de Papa', 80, N'0.8       ', N'El Señor Cara de Papa es un personaje secundario en la franquicia de Toy Story. Él es malhumorado, y está basado en el famoso juguete Señor Cara de Papa de Hasbro.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (7, N'https://static.wikia.nocookie.net/pixar/images/b/bd/James_P._Sullivan.png/revision/latest?cb=20160201000622&path-prefix=es', N'James P. Sullivan', 45, N'120       ', N'James "Jimmy" P. "Sulley" Sullivan es el protagonista de Monsters, Inc. y el deuteragonista de la precuela Monsters University. Él es un enorme monstruo con una piel peluda de color azul con manchas púrpuras, que tiene dos pequeños cuernos en la cabeza, y una larga cola.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (8, N'https://static.wikia.nocookie.net/pixar/images/6/6a/Mike_Wazowski.png/revision/latest?cb=20160131132812&path-prefix=es', N'Mike Wazowski', 40, N'20        ', N'Michael "Mike" Wazowski es el deuteragonista de Monsters, Inc. y el protagonista de la precuela Monsters University. Él es un monstruo esférico de color verde claro con un solo ojo grande, que tiene dos pequeños cuernos en la cabeza y brazos y piernas delgados ajuntados a cada lado de su torso.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (9, N'https://static.wikia.nocookie.net/pixar/images/7/7c/Boo.png/revision/latest/scale-to-width-down/341?cb=20160203155444&path-prefix=es', N'Boo', 6, N'6         ', N'Boo es la tritagonista de Monsters, Inc. — Ella es una niña humana de dos años de edad que se escapó de su habitación después de que Randall intentara secuestrarla para sus experimentos. Luego de su primer encuentro con Sulley, Sulley y Mike trataron en repetidas ocasiones devolverla a su hogar.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (10, N'https://static.wikia.nocookie.net/disney/images/c/c2/WALL%C2%B7E.png/revision/latest?cb=20111209193435&path-prefix=es', N'WALL-E', 1000, N'25        ', N'WALL·E (Waste Allocation Load Lifter: Earth class, cuyo significado en español es Levantadores de Carga de Residuos Clase-terrestre) es el protagonista de la película WALL·E. Es un dron recolector de desechos creado por la corporación Buy n Large inicialmente programado para transportar la basura que plaga la Tierra en un futuro lejano. Inesperadamente, sus años de soledad y trabajo interminable le permitieron ganar una conciencia propia y un deseo de algo más en la vida por venir. Un día, su mundo se pone patas arriba cuando conoce a otro robot del espacio exterior. Vive en la Tierra con su cucaracha Hal.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (11, N'https://static.wikia.nocookie.net/disney/images/6/6e/Hal.png/revision/latest/scale-to-width-down/200?cb=20111209212916&path-prefix=es', N'Hal', 100, N'0.1       ', N'Hal es un personaje menor de la película WALL·E.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (12, N'https://static.wikia.nocookie.net/disney/images/9/9e/EVA.png/revision/latest?cb=20111209212148&path-prefix=es', N'EVA', 30, N'15        ', N'EVA es un personaje de la película WALL·E.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (13, N'https://static.wikia.nocookie.net/disney/images/4/44/Rayo_McQueen.png/revision/latest/scale-to-width-down/350?cb=20140204155911&path-prefix=es', N'Rayo McQueen', 23, N'2500      ', N'El Rayo McQueen (Lightning McQueen en inglés) McQueen es uno de los personajes protagonistas principales de la franquicia de Disney/Pixar Cars.

El es un automóvil de carreras de color rojo que logró participar en la Copa Pistón cuando apenas era un novato. Sin embargo, cuando él rechazó reemplazar sus neumáticos a la mitad de una carrera, haciendo que sus neumáticos traseros estallaran, terminó quedando empatando con "El Rey" y Chick Hicks.

Rayo vive en un pequeño pueblo del desierto llamado Radiador Springs. Hasta que en Cars 3, Rayo se estrelló en la carrera contra Jackson Storm y se convirtió en jefe de equipo de Cruz Ramírez. Mientras sigue corriendo. Incluso cambió su color rojo favorito por el mismo color que Doc.

Es el protagonista de la película animada de Disney/Pixar del 2006 Cars y su secuela Cars 3, y co-protagonista de la secuela anterior Cars 2.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (14, N'https://static.wikia.nocookie.net/disney/images/d/dd/Doc_Hudson.png/revision/latest/scale-to-width-down/350?cb=20140205195818&path-prefix=es', N'Doc Hudson', 60, N'2300      ', N'Hudson Hornet, o Doc Hudson, es el deuteragonista de la película Cars y un personaje postumo en Cars 2 y Cars 3.
Es un coche de pocas palabras, pero de muchos talentos. No solo se desempeña como juez de la ciudad, sino que también es el médico residente de Radiator Springs. Doc es respetado y admirado por la gente del pueblo por la forma en que vela por su salud y atiende sus dolores y molestias. Nadie sabe demasiado sobre Doc antes de que llegara a la ciudad. Mantiene en privado su vida privada sobre ser un auto de carreras famoso y después de que Rayo McQueen llegó a la ciudad, primero se molestó y lo odia porque es un auto de carreras y arruinó la carretera por accidente, pero después de demostrar que cambió, deja que Rayo se instale. su cuartel general de carreras en Radiator Springs y convertirse en el mentor de McQueen.

Fue un ex corredor de carreras de tierra y una leyenda de la Copa Piston que se desempeñó como juez y médico de Radiator Springs , antes de su muerte entre los eventos de Cars: Race-O-Rama y Cars 2 . En memoria de Doc, el trofeo de la Serie de Carreras de la Copa Piston pasó a llamarse Copa Pistón Hudson Hornet, y el Museo de Carreras ahora contiene recuerdos relacionados con Doc, incluidos periódicos antiguos y trofeos de Doc.')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia]) VALUES (15, N'https://static.wikia.nocookie.net/disney/images/9/94/ChickHicksCars3.png/revision/latest/scale-to-width-down/350?cb=20230509155526&path-prefix=es', N'Chick Hicks', 30, N'2600      ', N'Chick Trueno Hicks es el antagonista principal de la película Cars y un personaje menor en Cars 3 . Es un corredor retirado de la Copa Piston engreído y egocéntrico que aparece como el archienemigo de Rayo McQueen y Strip Weathers, ademas uno de los rivales mas veloces de McQueen durante la franquicia.')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
USE [master]
GO
ALTER DATABASE [DisneyBD] SET  READ_WRITE 
GO
