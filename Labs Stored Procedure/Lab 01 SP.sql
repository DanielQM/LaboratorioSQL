/* Visualizar todas las BD del servidor */
EXEC sp_databases
GO

/* Visualiza los SP de la BD */
EXEC sp_stored_procedures
GO

/* Lista tablas y vistas de una BD activa */
EXEC sp_tables
GO

/* Mi primer Procedimiento Almacenado */
CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma
    END
GO

/* Ejecutar mi primer Procedimiento Almacenado */
EXEC sp_SumNum
GO

/* Modificar mi Procedimiento Almacenado */
ALTER PROCEDURE sp_SumNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Total'
    END
GO

/* Crear mi segundo Procedimiento Almacenado */
CREATE PROCEDURE sp_MultNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno * @VarDos
        SELECT @Suma AS 'Total'
    END
GO

/* Ejecutar mi segundo Procedimiento Almacenado */
EXEC sp_MultNum
GO

/* Eliminar mi Procedimiento Almacenado */
DROP PROCEDURE sp_SumNum
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la sumatoria de ellos */
CREATE PROCEDURE sp_SumNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno + @VarDos
        SELECT @Suma AS 'Total'
    END
GO

/* Sumando dos números */
EXEC sp_SumNum2 @VarUno = 300, @VarDos = 600
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la producto de ellos */
CREATE PROCEDURE sp_MultNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
    BEGIN
        SET @Suma = @VarUno * @VarDos
        SELECT @Suma AS 'Total'
    END
GO

/*  Multiplicando dos números*/
EXEC sp_MultNum2 @VarUno = 60, @VarDos = 2
GO

/* Elaborar un SP que permita ingresar dos números y devolver el mayor de ellos */
CREATE PROCEDURE sp_Evaluar
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno > @NumDos
            SELECT @NumUno AS 'Número mayor'
        ELSE
            SELECT @NumDos AS 'Número mayor'
    END
GO

/* Comparando números */
EXEC sp_Evaluar @NumUno = 50, @NumDos = 50
GO

/* Elaborar SP que compare los números iguales */
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE IF @NumUno > @NumDos
           SELECT @NumUno AS 'Número mayor'
        ELSE
            SELECT @NumDos AS 'Número mayor'
    END
GO

/* Comparando números */
EXEC sp_Evaluar2 @NumUno = 50, @NumDos = 50
GO

/* Números por orden */
CREATE PROCEDURE sp_Evaluar3
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
            PRINT 'Los números son iguales'
        ELSE IF @NumUno > @NumDos
           SELECT @NumUno AS 'Número mayor', @NumDos AS 'Número menor'
        ELSE
            SELECT @NumDos AS 'Número mayor', @NumUno AS 'Número menor'
    END
GO

EXEC sp_Evaluar3 @NumUno = 60, @NumDos = 90
GO

/* Elaborar un SP que permita enumerar una debida cantidad de números */
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE(@Inicio < @Num)
        BEGIN
            SET @Inicio = @Inicio + 1
            PRINT @Inicio
        END
    END
GO

EXEC sp_Listar @Num = 5
GO

/* Elaborar un SP que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMAS" de acuerdo a un número que ha sido ingresado */
CREATE PROCEDURE sp_Listar2
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE(@Inicio < @Num)
        BEGIN
            SET @Inicio = @Inicio + 1
            PRINT 'RETROCEDER NUNCA, RENDIRSE JAMAS'
        END
    END
GO

EXEC sp_Listar2 @Num = 5
GO

/* Elaborar un SP que permita ingresar un nombre y devuelva un mensaje de saludo con el mismo nombre */
CREATE PROCEDURE sp_Saludo
    @Nombre varchar(40)
AS
    BEGIN
        PRINT 'Hola ' +@Nombre
    END
GO

EXEC sp_Saludo @Nombre = Daniel
GO

/* Ver la configuración de idioma del servidor */
SELECT @@LANGUAGE
GO

/* Ver formato de fecha de acuerdo al idioma */
EXEC sp_helplanguage
GO

/* Elaborar un SP que permita ingresar un nombre y una fecha de nacimiento */
CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
    @FecNac DATE
AS
    BEGIN
        SELECT @Nombre AS 'Nombre', @FecNac AS 'Fecha de Nacimiento'
    END
GO

EXEC sp_NomFecNac @Nombre = Daniel, @FecNac = '01/31/2000'
GO

/* Elaborar un SP que permita ingresar un nombre y fecha de nacimiento en formato dd/mm/yyyy */
CREATE PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS 'Nombre', CONVERT(DATE, @FecNac, 103) AS 'Fecha de Nacimiento'
    END
GO

EXEC sp_NomFecNac2 @Nombre = Daniel, @FecNac = '31/01/2000'
GO

/* Modificando el SP */
ALTER PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS 'Nombre', FORMAT(CONVERT(DATE, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento'
    END
GO

EXEC sp_NomFecNac2 @Nombre = Daniel, @FecNac = '31/01/2000'
GO

/* Elaborar un SP un nombre, un fecha de nacimiento y devuelva los mismo datos más la edad basada en años*/
CREATE PROCEDURE sp_NomFecNac3
    @Nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @Nombre AS 'Nombre',
        FORMAT(CONVERT(DATE, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR, CONVERT(DATE, @FecNac, 103), GETDATE()) AS 'Edad'
    END
GO

EXEC sp_NomFecNac3 @Nombre = 'Daniel', @FecNac = '31/01/2000'
