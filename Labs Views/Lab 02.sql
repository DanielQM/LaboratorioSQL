select * from Autor;
SELECT * from Pais;
select * from Bibliotecario;
select * from Cliente;
select * from Libro;
select * from Genero;
select * from Prestamos;

SELECT tituloLibro, Genero.nomGenero
FROM Libro
INNER JOIN Genero ON Libro.Genero_idGenero = Genero.idGenero

SELECT tituloLibro, Pais.nomPais
FROM Libro
INNER JOIN Pais ON Libro.Pais_idPais = Pais.idPais;

SELECT tituloLibro, Autor.nomAutor, Autor.apeAutor
FROM Libro
INNER JOIN Autor ON Libro.Autor_idAutor = Autor.idAutor


SELECT tituloLibro, Genero.nomGenero, Pais.nomPais,
CONCAT(Autor.nomAutor,' ',Autor.apeAutor) AS Autor
FROM Libro
INNER JOIN Genero ON Libro.Genero_idGenero = Genero.idGenero
INNER JOIN Pais ON Libro.Pais_idPais = Pais.idPais
INNER JOIN Autor ON Libro.Autor_idAutor = Autor.idAutor
GO

/* Creando una Vista */
CREATE VIEW vwDatosLibro
AS
SELECT tituloLibro, Autor.nomAutor, Autor.apeAutor
FROM Libro
INNER JOIN Autor ON Libro.Autor_idAutor = Autor.idAutor
GO

/* Ver registros de una Vista */
SELECT * FROM vwDatosLibro;
GO

CREATE VIEW vwDatosAutor
AS
SELECT tituloLibro, Genero.nomGenero, Pais.nomPais,
CONCAT(Autor.nomAutor,' ',Autor.apeAutor) AS Autor
FROM Libro
INNER JOIN Genero ON Libro.Genero_idGenero = Genero.idGenero
INNER JOIN Pais ON Libro.Pais_idPais = Pais.idPais
INNER JOIN Autor ON Libro.Autor_idAutor = Autor.idAutor
GO

/* Listar en Vista la cantidad de libros por Género */
CREATE VIEW vwGenLib
AS
SELECT COUNT(Libro.Genero_idGenero) AS Total, Genero.nomGenero
FROM Libro
INNER JOIN Genero ON Libro.Genero_idGenero = Genero.idGenero
GROUP BY Genero.nomGenero;
GO

/* Vista con cantidad de Libros por País */
CREATE VIEW vwPaisLib
AS
SELECT COUNT(Libro.Pais_idPais) AS Total, Pais.nomPais
FROM Libro
INNER JOIN Pais ON Libro.Pais_idPais = Pais.idPais
GROUP BY Pais.nomPais
GO

/* Ver listado de las Vistas */
SELECT name FROM sys.views
GO

/* Visualizar en una vista la fecha del préstamo, el nombre del bibliotecario, el título del libro y el cliente que a hecho el préstamo */
CREATE VIEW vwDatosPrestamos
AS
SELECT fecsalPrestamo AS 'Fecha de Préstamo', Bibliotecario.nomBibliotecario AS 'Bibliotecario',
Libro.tituloLibro AS 'Libro', Cliente.nomCliente AS 'Cliente'
FROM Prestamos
INNER JOIN Bibliotecario ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
INNER JOIN Detalle_Prestamo ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
INNER JOIN Libro ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
INNER JOIN Cliente ON Prestamos.Cliente_idCliente = Cliente.idCliente
GO