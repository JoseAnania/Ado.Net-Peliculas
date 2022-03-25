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

CREATE PROCEDURE SP_InsertarPelicula
@nombrePelicula VARCHAR(100),
@anio SMALLDATETIME,
@duracion INT,
@codPais VARCHAR(3),
@clasificacion DECIMAL(2,1)
AS	
	BEGIN
		IF (SELECT COUNT(*) FROM Pelicula WHERE nombrePelicula=@nombrePelicula)>0
		PRINT 'YA EXISTE ESE NOMBRE DE Pelicula (Cargar sin usar el Procedimiento Almacenado)'
		ELSE
		INSERT INTO Pelicula(nombrePelicula, anio, duracion, codPais, clasificacion) 
		VALUES (@nombrePelicula, @anio, @duracion, UPPER(@codPais), @clasificacion)
	END
	
EXEC SP_InsertarPelicula '', '', , '', 