/* Permita ingresar el nombre de un empleado, su fecha de ingreso a la empresa y determine la cantidad de años de permanencia */
CREATE PROCEDURE sp_Trabajo1
    @Nombre VARCHAR(40),
    @Fecha VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS 'Nombre',
        FORMAT(CONVERT(DATE, @Fecha, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(DATE, @Fecha, 103), GETDATE()) AS 'Años trabajando'
    END
GO

EXEC sp_Trabajo1 @Nombre = 'Daniel', @Fecha = '06/06/2015'
GO

/* Ingrese un número e imprima el texto " Mensaje de prueba" */
CREATE PROCEDURE sp_Trabajo2
    @Numero INT,
    @Inicial INT = 0
AS
    BEGIN
        WHILE(@Inicial < @Numero)
        BEGIN
            SET @Inicial = @Inicial + 1
            PRINT 'Mensaje de prueba'
        END
    END
GO

EXEC sp_Trabajo2 @Numero = 3
GO

/* Ingrese 3 números y los permita ordenar de mayor e menor */

/* Elaborar una vista que permita Visualizar el número de pedidos atendidos por bibliotecario */
CREATE VIEW VW_Trabajo4
AS
    SELECT COUNT(Prestamos.Bibliotecario_idBibliotecario) AS 'Pedidos', Bibliotecario.nomBibliotecario
    FROM Prestamos
    INNER JOIN Bibliotecario ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
    GROUP BY Bibliotecario.nomBibliotecario
GO

SELECT * FROM VW_Trabajo4
GO

/* Elaborar una vista que permita visualisar: codigo de prestamo, fecha de prestamo, bibliotecario, libro, autor y género */
CREATE VIEW VW_Trabajo5
AS
    SELECT idPrestamo, fecsalPrestamo, Bibliotecario.nomBibliotecario, Libro.tituloLibro, Autor.nomAutor, Genero.nomGenero
    FROM Prestamos
    INNER JOIN Detalle_Prestamo ON Detalle_Prestamo.Prestamos_idPrestamo = Prestamos.idPrestamo
    INNER JOIN Libro ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
    INNER JOIN Genero ON Libro.Genero_idGenero = Genero.idGenero
    INNER JOIN Autor ON Libro.Autor_idAutor = Autor.idAutor
    INNER JOIN Bibliotecario ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
GO

SELECT * FROM VW_Trabajo5
GO
