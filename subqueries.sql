-- SUBQUERY
/*
Question 1 Local:
Query the Orders table and return information about the order that has the maximum order ID in the table
*/

-- SUBQUERY IN WHERE
SELECT MAX(SalesOrderID)
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE SalesOrderID = (SELECT MAX(SalesOrderID)
					  FROM Sales.SalesOrderHeader);

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
ORDER BY OrderDate;

--display orders placed on the same date as order id 43659
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate = (SELECT OrderDate
					  FROM Sales.SalesOrderHeader
					  WHERE SalesOrderID = 43659);

-- using variables
DECLARE @odate DATE = (SELECT OrderDate
					  FROM Sales.SalesOrderHeader
					  WHERE SalesOrderID = 43659);
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate = @odate;

-- SUBQUERY IN SELECT
SELECT SalesOrderID, OrderDate,
		(SELECT MAX(SalesOrderID)
		FROM Sales.SalesOrderHeader)
FROM Sales.SalesOrderHeader;

-- Question: return the order number and dates of orders placed by any customer whose lastname starts with the letter Z.

SELECT CustomerID, LastName
FROM Sales.Customer c JOIN Person.Person p
						ON c.PersonID = p.BusinessEntityID
WHERE LastName LIKE 'Z%';

SELECT c.CustomerID, SalesOrderID, OrderDate
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
					  ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = (SELECT CustomerID -- ERROR: Msg 512, Level 16, State 1, Line 48. Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
					  FROM Sales.Customer c JOIN Person.Person p
					  ON c.PersonID = p.BusinessEntityID
					  WHERE LastName LIKE 'Z%');
					  
SELECT c.CustomerID, SalesOrderID, OrderDate
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
					  ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IN (SELECT CustomerID 
					  FROM Sales.Customer c JOIN Person.Person p
					  ON c.PersonID = p.BusinessEntityID
					  WHERE LastName LIKE 'Z%');

SELECT c.CustomerID, SalesOrderID, OrderDate
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
					  ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IN (SELECT CustomerID -- Uses IN to filter customers whose CustomerID is in the result set of the subquery
					  FROM Sales.Customer c JOIN Person.Person p
					  ON c.PersonID = p.BusinessEntityID
					  WHERE LastName LIKE 'Z%')
ORDER BY 1;

SELECT c.CustomerID, SalesOrderID, OrderDate
FROM Sales.Customer c JOIN Sales.SalesOrderHeader o
					  ON c.CustomerID = o.CustomerID
WHERE c.CustomerID <ANY (SELECT CustomerID -- Uses <ANY to filter customers whose CustomerID is less than any CustomerID in the subquery result set
					  FROM Sales.Customer c JOIN Person.Person p
					  ON c.PersonID = p.BusinessEntityID
					  WHERE LastName LIKE 'Z%')
ORDER BY 1;

-- A query that returns orders with the maximum order ID for each customer
SELECT SalesOrderID, CustomerID
FROM Sales.SalesOrderHeader
ORDER BY 2, 1; -- 2: Sort the results primarily by the second column in the SELECT clause, which is CustomerID. 1: Within each group of identical CustomerID values, sort by the first column in the SELECT clause, which is SalesOrderID.

SELECT SalesOrderID, CustomerID
FROM Sales.SalesOrderHeader OO -- OO outer order table
WHERE SalesOrderID = (SELECT MAX(IO.SalesOrderID)
					  FROM Sales.SalesOrderHeader IO
					  WHERE OO.CustomerID = IO.CustomerID)
ORDER BY 2, 1;

