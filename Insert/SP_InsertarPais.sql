CREATE TABLE Pais
(
codPais VARCHAR(3) NOT NULL,
nombrePais VARCHAR(50) NOT NULL
CONSTRAINT PK_Pais PRIMARY KEY (codPais)
)

CREATE PROCEDURE SP_InsertarPais
@codPais VARCHAR(3),
@nombrePais VARCHAR (50)
AS	
	BEGIN
		IF (SELECT COUNT(*) FROM Pais WHERE codPais=@codPais)>0
		PRINT 'YA EXISTE ESE CODIGO DE PAIS'
		IF (SELECT COUNT(*) FROM Pais WHERE nombrePais=@nombrePais)>0
		PRINT 'YA EXISTE ESE NOMBRE DE PAIS'
		ELSE
		INSERT INTO Pais(codPais, nombrePais) 
		VALUES (UPPER(@codPais), @nombrePais)
	END
	
EXEC SP_InsertarPais 'PRB', 'Prueba'