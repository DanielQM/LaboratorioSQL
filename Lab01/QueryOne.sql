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