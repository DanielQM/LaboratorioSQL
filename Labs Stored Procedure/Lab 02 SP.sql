/* Visualizar los registros de la tabla Género */
SELECT * FROM Genero
GO

/* Crear un SP que permita listar los registros de la tabla género */
CREATE PROCEDURE sp_ListGen
AS
    BEGIN
        SELECT * FROM Genero
    END
GO

/* Ejecutar Store Procedure de listado de género */
EXEC sp_ListGen
GO

/* Crear un Store Procedure que permita listar los registros de la tabla cliente */
CREATE PROCEDURE sp_ListCli
AS
    BEGIN
        SELECT * FROM Cliente
    END
GO

EXEC sp_ListCli
GO

/* Crear un SP que permita listar los clientes ordenados por la columna Sexo de forma ascendente */
CREATE PROCEDURE sp_ListClienteSexo
AS
    BEGIN
        SELECT * FROM Cliente
        ORDER BY sexoCliente ASC
    END
GO

EXEC sp_ListClienteSexo
GO

/* Modificar el SP de tal forma que permita modificar el listado del cliente de acuerdo a la letra del sexo indicado */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo varchar(1)
AS
    BEGIN
        SELECT * FROM Cliente
        WHERE sexoCliente = @Sexo
    END
GO

EXEC sp_ListClienteSexo @Sexo='M'
GO

/* Modificar el SP de tal forma que se vea completo el nombre del sexo */
ALTER PROCEDURE sp_ListClienteSexo
    @Sexo varchar(1)
AS
    BEGIN
        SELECT CONCAT(nomCliente,', ',apeCliente) AS 'Cliente', dniCliente,
        Sexo = 
        CASE
            WHEN sexoCliente = 'F' THEN 'Femenino'
            WHEN sexoCliente = 'M' THEN 'Masculino'
        END
        FROM Cliente
        WHERE Cliente.sexoCliente = @Sexo
    END
GO

EXEC sp_ListClienteSexo @Sexo='M'
GO

/* Crear un SP que permita ingresar un registro a la tabla Género */
CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR(4),
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        INSERT INTO Genero
            (idGenero,nomGenero)
        VALUES
            (@Codigo, @Nombre)
    END
GO

EXEC sp_AddGen @Codigo='5', @Nombre='Comedia'
GO

/* Verificamos que se haya agregado el registro */
SELECT * FROM Genero
GO

/* Agregar los Géneros Infantil, Obra Literaria y Drama */
EXEC sp_AddGen @Codigo='6', @Nombre='Infantil'
EXEC sp_AddGen @Codigo='7', @Nombre='Obra Literaria'
EXEC sp_AddGen @Codigo='8', @Nombre='Drama'
GO

SELECT * FROM Genero
GO

/* Elaborar un SP que permita validar el código de género antes de ingresar un registro */
CREATE PROCEDURE sp_AddGenVal
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
        IF(SELECT Genero.idGenero
            FROM Genero
            WHERE Genero.idGenero = @Codigo) IS NOT NULL
            PRINT 'NO PUEDES INGRESAR EL REGISTRO PORQUE EL CÓDIGO YA EXISTE'
        ELSE
            INSERT INTO Genero
                (idGenero,nomGenero)
            VALUES
                (@Codigo, @Nombre)
        SELECT * FROM Genero
        ORDER BY IdGenero
    END
GO

/* Validar ingreso de género con el código 2 */
EXEC sp_AddGenVal @Codigo='8', @Nombre='Drama'
EXEC sp_AddGenVal @Codigo='9', @Nombre='Series'
EXEC sp_AddGenVal @Codigo='10', @Nombre='Cuentos'
EXEC sp_AddGenVal @Codigo='11', @Nombre='Comics'
GO

SELECT * FROM Genero
GO

/* Eliminar registro a través de un SP */
ALTER PROCEDURE sp_DelGen
    @Codigo VARCHAR(4)
AS
    BEGIN
        IF(SELECT Genero.idGenero
            FROM Genero
            WHERE Genero.idGenero = @Codigo) IS NULL
            SELECT 'El código no existe' AS 'Resultado'
        ELSE
            DELETE FROM Genero
            WHERE IdGenero = @Codigo
            SELECT * FROM Genero
    END    
GO

EXEC sp_DelGen @Codigo = '10'
GO

SELECT * FROM Genero
GO