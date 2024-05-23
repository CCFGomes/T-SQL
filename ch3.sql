-- CROSS JOIN
SELECT CustomerID, BusinessEntityID
FROM Sales.Customer CROSS JOIN HumanResources.Employee

-- Self Join
SELECT p1.ProductID,p2.Name
FROM Production.Product p1 CROSS JOIN Production.Product p2

--Inner Join
SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer c INNER JOIN Sales.SalesOrderHeader o
							ON	c.CustomerID = o.CustomerID;

SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer c , Sales.SalesOrderHeader o
WHERE	c.CustomerID = o.CustomerID;

SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
							ON	c.CustomerID = o.CustomerID
WHERE c.CustomerID <= 11000;

SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
							ON	c.CustomerID = o.CustomerID
							AND c.CustomerID <= 11000;

SELECT c.CustomerID, p.FirstName, o.SalesOrderID
FROM Person.Person p JOIN Sales.Customer c ON p.BusinessEntityID = c.PersonId 
					 JOIN Sales.SalesOrderHeader o ON	c.CustomerID = o.CustomerID
WHERE c.CustomerID <= 11000;

-- Display customer id and order id for customers who placed orders
SELECT c.CustomerID, SalesOrderID
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
					  ON   c.CustomerID = o.CustomerID

-- Display customer id and order id for customers 
-- whether they placed orders or not 
SELECT c.CustomerID, SalesOrderID
FROM Sales.Customer c LEFT JOIN Sales.SalesOrderHeader o
					  ON   c.CustomerID = o.CustomerID
ORDER BY SalesOrderID;

SELECT c.CustomerID, SalesOrderID
FROM Sales.Customer c RIGHT JOIN Sales.SalesOrderHeader o
					  ON   c.CustomerID = o.CustomerID
ORDER BY SalesOrderID;

SELECT c.CustomerID, SalesOrderID
FROM Sales.Customer c FULL JOIN Sales.SalesOrderHeader o
					  ON   c.CustomerID = o.CustomerID
ORDER BY SalesOrderID;

SELECT c.CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader o RIGHT JOIN Sales.Customer c 
					  ON   c.CustomerID = o.CustomerID
ORDER BY SalesOrderID;