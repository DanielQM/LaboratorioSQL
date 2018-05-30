use AdventureWorks2016

SELECT * FROM Person.Person
CREATE VIEW vw_Persona
as 
SELECT firstName, LastName
FROM Person.Person

SELECT * FROM vw_Persona

CREATE VIEW vw_Persona2
as 
SELECT firstName, LastName
FROM Person.Person
where LastName like 'Adams'

SELECT * FROM vw_Persona2

CREATE VIEW vw_Persona3
as 
SELECT
CONCAT (FirstName,',',LastName) as Datos
FROM Person.Person
where LastName like 'Adams'

SELECT * FROM vw_Persona3