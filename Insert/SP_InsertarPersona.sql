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

CREATE PROCEDURE SP_InsertarPersona
@nombrePersona VARCHAR(100),
@apellidoPersona VARCHAR(50),
@fechaNacimiento SMALLDATETIME,
@codPais VARCHAR(3)
AS	
	BEGIN
		IF (SELECT COUNT(*) FROM Persona WHERE nombrePersona=@nombrePersona)>0
		AND (SELECT COUNT(*) FROM Persona WHERE apellidoPersona=@apellidoPersona)>0
		PRINT 'YA EXISTE ESE NOMBRE DE Persona (Cargar sin usar el Procedimiento Almacenado)'
		ELSE
		INSERT INTO Persona(nombrePersona, apellidoPersona, fechaNacimiento, codPais) 
		VALUES (@nombrePersona, @apellidoPersona, @fechaNacimiento, UPPER(@codPais))
	END
	
EXEC SP_InsertarPersona '', '', '', '' 