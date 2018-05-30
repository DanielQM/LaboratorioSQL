/* Práctica Calificada de MS SQL Server 
  Para esta práctica vamos a utilizar la base de datos Adventure Works 2016 
  Elabore el código Transact SQL para resolver los siguiente enunciados */
  


  /* Se necesita listar los empleados y sus respectivos departamentos en el que laboran */
 
 CREATE VIEW vw_Empleado
 AS
    SELECT FirstName, Department
    FROM HumanResources.vEmployeeDepartment
    go

SELECT * FROM vw_Empleado
go



  /* Se necesita saber la cantidad de empleados por departamento */

CREATE VIEW vw_Departamento
    AS
        SELECT Department, SUM(Department) as 'Suma'
        FROM HumanResources.vEmployeeDepartment
        GO



  /* Se necesita listar las cantidades de ventas realizadas por año */


  /* Se necesita listar los empleados con su respectivo correo y número de teléfono */



  /* Se necesita saber la cantidad de ventas atendidas por cada vendedor */


  ---Cada uno de los enunciados deben ser considerados Vistas

  --Se calificará desde su repositorio de GitHub en la que deberá crear una carpeta llamada Práctica Calificada 