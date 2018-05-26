/*Crear BD en Blanco*/
CREATE DATABASE HospitalHHH
GO

/* Necesito visualizar el listado de base de datos de tu servidor */

SELECT database_id, name 
FROM sys.databaseS
GO

/* Poner en uso una base de datos */

USE HospitalHHH
GO

/* Ver el listado de tablas de una base de datos */
USE AdventureWorks2016
SELECT name FROM sys.tables
GO

/* Ver listado de vistas de una base de datos */
USE AdventureWorks2016
SELECT name FROM sys.views
GO

/* Visualizar la información detallada de una base de datos */
EXEC sp_helpdb AdventureWorks2016
GO

/* Utilizando snippets */
-- Create a new database called 'ColegioMG'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'ColegioMG'
)
CREATE DATABASE ColegioMG
GO

/* Eliminar una Base de Datos */
DROP DATABASE HospitalHHH
GO

/* Eliminar base de datos AdventureWorks2016 */
DROP DATABASE AdventureWorks2016
GO
DROP DATABASE AdventureWorks
GO