use AdventureWorks2016;

/* Muestrame el nombre, apellido, departamento y estado civil del empleado */
SELECT 
Person.Person.FirstName AS Nombres,
Person.LastName AS Apellidos,
HumanResources.Department.Name AS Departamento,
HumanResources.Employee.MaritalStatus AS 'Estado Civil'

FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
INNER JOIN HumanResources.Employee
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
GROUP BY HumanResources.Department.Name, Person.FirstName, Person.LastName, HumanResources.Employee.MaritalStatus
GO

/* Mostrar el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */
SELECT CONCAT(Person.LastName, ',',Person.FirstName) AS Cliente, 
CONCAT(MONTH(OrderDate),'/',YEAR(OrderDate)) AS 'Mes y Año'
FROM Sales.SalesOrderHeader
INNER JOIN Sales.Customer ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
INNER JOIN Person.Person ON Customer.PersonID = Person.BusinessEntityID
WHERE YEAR(OrderDate) = 2012 AND (MONTH(OrderDate) BETWEEN 11 AND 12)

/* Mostrar la cantidad de ordenes de pedido atendidos por cada medio de envío */
SELECT Purchasing.ShipMethod.Name AS 'Medio de Envío', COUNT(Purchasing.ShipMethod.Name) AS 'Cantidad'
FROM Sales.SalesOrderHeader
INNER JOIN Purchasing .ShipMethod ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name

/* Mostrar la cantidad de ventas realizadas de acuerdo al país */
SELECT  País = 
    CASE
    WHEN Sales.SalesTerritory.CountryRegionCode = 'AU' THEN 'Australia'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'US' THEN 'Estados Unidos'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'DE' THEN 'Alemania'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'FR' THEN 'Francia'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'GB' THEN 'Inglaterra'
    WHEN Sales.SalesTerritory.CountryRegionCode = 'CA' THEN 'Canadá'
    END,
    COUNT(Sales.SalesOrderHeader.TerritoryID) AS 'Total'
FROM Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY Sales.SalesTerritory.CountryRegionCode
ORDER BY Sales.SalesTerritory.CountryRegionCode