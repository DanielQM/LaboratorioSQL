use AdventureWorks2016
GO

SELECT * FROM Person.Person
GO

CREATE VIEW vw_Persona
as 
SELECT firstName, LastName
FROM Person.Person
GO

SELECT * FROM vw_Persona
GO

CREATE VIEW vw_Persona2
as 
SELECT firstName, LastName
FROM Person.Person
where LastName like 'Adams'
GO

SELECT * FROM vw_Persona2
GO

CREATE VIEW vw_Persona3
as 
SELECT
CONCAT (FirstName,',',LastName) as Datos
FROM Person.Person
where LastName like 'Adams'
GO

SELECT * FROM vw_Persona3

/* END FILE */