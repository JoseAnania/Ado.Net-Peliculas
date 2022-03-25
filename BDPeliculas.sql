CREATE DATABASE PELICULAS

USE PELICULAS
----------------------------------
CREATE TABLE Pais
(
codPais VARCHAR(3) NOT NULL,
nombrePais VARCHAR(50) NOT NULL
CONSTRAINT PK_Pais PRIMARY KEY (codPais)
)
----------------------------------
CREATE TABLE Genero
(
idGenero INT IDENTITY(1,1),
nombreGenero VARCHAR(50) NOT NULL,
CONSTRAINT PK_Genero PRIMARY KEY (idGenero)
)
----------------------------------
CREATE TABLE Premio
(
idPremio INT IDENTITY(1,1),
nombrePremio VARCHAR(50) NOT NULL,
CONSTRAINT PK_Premio PRIMARY KEY (idPremio)
)
----------------------------------
CREATE TABLE CategoriaPremio
(
idCategoria INT IDENTITY(1,1),
nombreCategoria VARCHAR(50) NOT NULL,
idPremio INT,
CONSTRAINT PK_CategoriaPremio PRIMARY KEY (idCategoria),
CONSTRAINT FK_CategoriaPremio_Premio FOREIGN KEY (idPremio) REFERENCES Premio (idPremio),
)
----------------------------------
CREATE TABLE Pelicula
(
idPelicula INT IDENTITY(1,1),
nombrePelicula VARCHAR(100) NOT NULL,
anio SMALLDATETIME NULL,
duracion INT NULL,
codPais VARCHAR(3),
clasificacion DECIMAL(2,1) NULL,
CONSTRAINT PK_Pelicula PRIMARY KEY (idPelicula),
CONSTRAINT FK_Pelicula_Pais FOREIGN KEY (codPais) REFERENCES Pais (codPais),
)
----------------------------------
CREATE TABLE Persona
(
idPersona INT IDENTITY(1,1),
nombrePersona VARCHAR(100) NOT NULL,
apellidoPersona VARCHAR(50) NOT NULL,
fechaNacimiento SMALLDATETIME NULL,
codPais VARCHAR(3),
CONSTRAINT PK_Persona PRIMARY KEY (idPersona),
CONSTRAINT FK_Persona_Pais FOREIGN KEY (codPais) REFERENCES Pais (codPais)
)
----------------------------------
CREATE TABLE GeneroPelicula
(
idGenero INT,
idPelicula INT,
CONSTRAINT PK_GeneroPelicula PRIMARY KEY (idGenero, idPelicula),
CONSTRAINT FK_GeneroPelicula_Genero FOREIGN KEY (idGenero) REFERENCES Genero (idGenero),
CONSTRAINT FK_GeneroPelicula_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
)
----------------------------------
CREATE TABLE Director
(
idPersona INT,
idPelicula INT,
CONSTRAINT PK_Director PRIMARY KEY (idPersona, idPelicula),
CONSTRAINT FK_Director_Persona FOREIGN KEY (idPersona) REFERENCES Persona (idPersona),
CONSTRAINT FK_Director_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
)
----------------------------------
CREATE TABLE Actor
(
idPersona INT,
idPelicula INT,
CONSTRAINT PK_Actor PRIMARY KEY (idPersona, idPelicula),
CONSTRAINT FK_Actor_Persona FOREIGN KEY (idPersona) REFERENCES Persona (idPersona),
CONSTRAINT FK_Actor_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
)
----------------------------------
CREATE TABLE PremioPelicula
(
idCategoria INT,
idPelicula INT,
nomGan BIT,
anio SMALLDATETIME,
CONSTRAINT PK_PremioPelicula PRIMARY KEY (idCategoria, idPelicula),
CONSTRAINT FK_PremioPelicula_Categoria FOREIGN KEY (idCategoria) REFERENCES CategoriaPremio (idCategoria),
CONSTRAINT FK_PremioPelicula_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula)
)
----------------------------------
CREATE TABLE PremioPersona
(
idCategoria INT,
idPelicula INT,
idPersona INT,
nomGan BIT,
anio SMALLDATETIME,
CONSTRAINT PK_PremioPersona PRIMARY KEY (idCategoria, idPelicula, idPersona),
CONSTRAINT FK_PremioPersona_Categoria FOREIGN KEY (idCategoria) REFERENCES CategoriaPremio (idCategoria),
CONSTRAINT FK_PremioPersona_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula (idPelicula),
CONSTRAINT FK_PremioPersona_Persona FOREIGN KEY (idPersona) REFERENCES Persona (idPersona)
)
----------------------------------
