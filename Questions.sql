--Q1: Display products information for orders placed by specific customer
-- what are the fields, 
-- where they exist, 
--how these tables are related to each other

SELECT o.CustomerID, o.SalesOrderID, p.ProductID
FROM Sales.SalesOrderHeader as o JOIN Sales.SalesOrderDetail od
ON o.SalesOrderID = od.SalesOrderID
JOIN Production.Product p
ON od.ProductID = p.ProductID;

-- Q2: display order information with the max value
SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue = (SELECT MAX(TotalDue)
					  FROM Sales.SalesOrderHeader);

SELECT SalesOrderID, SubTotal + TaxAmt
FROM Sales.SalesOrderHeader
WHERE SubTotal + TaxAmt = (
SELECT MAX(SubTotal + TaxAmt)
FROM Sales.SalesOrderHeader);

-- Q3: display employees who work in the same department as Ken Sanchez -- TO BE CONTINUED
