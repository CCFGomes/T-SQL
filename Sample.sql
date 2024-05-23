USE AdventureWorks2022;
/* display all persons data */
SELECT *
FROM Person.Person;

-- display Persons data including person id, person type, first name, last name
SELECT BusinessEntityID, PersonType, FirstName AS 'First Name', LastName
FROM Person.Person;

-- display the full name of a person in the format "First name last name"
SELECT FirstName + ' ' + LastName AS 'Full Name'
FROM Person.Person;

-- Display persons whose title is 'MS.'
SELECT FirstName + ' ' + LastName AS 'Full Name',
		Title
FROM Person.Person
WHERE Title = 'ms.';

-- Display persons whose title is 'MS.' and the Type is 'em'
SELECT FirstName + ' ' + LastName AS 'Full Name',
		Title, PersonType
FROM Person.Person
WHERE Title = 'ms.'AND PersonType = 'EM';

-- Display persons whose title is 'MS.' or the Type is 'em'
SELECT FirstName + ' ' + LastName AS 'Full Name',
		Title, PersonType
FROM Person.Person
WHERE Title = 'ms.'OR PersonType = 'EM';


SELECT COUNT(*)
FROM Person.Person
WHERE Title = 'ms.'OR PersonType = 'EM';

-- qualifying the columns
SELECT p.FirstName, p.LastName
FROM Person.Person AS p;

-- IN operator
SELECT  BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID NOT IN (1,3,5,7);

-- BETWEEN-AND operator
SELECT  BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID BETWEEN 10 AND 20
ORDER BY BusinessEntityID;

-- NOT BETWEEN-AND operator
SELECT  BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID NOT BETWEEN 10 AND 20
ORDER BY BusinessEntityID;

-- Includingmath expression
SELECT ProductID, Name, ListPrice 'Price',
		ListPrice * 0.1 '10% discount',
		ListPrice * 0.9 'Discounted Price', GETDATE() 'Today'
FROM Production.Product;

-- AND example
-- Display the orders between 2 dates
SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-06-01' AND OrderDate <= '2011-06-02'
ORDER BY OrderDate;

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-06-01' AND '2011-06-02'
ORDER BY OrderDate -- or 2(second column) and you will get the same result;

SELECT SalesOrderID, OrderDate 'Order Date', TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-06-01' AND '2011-06-02'
ORDER BY 'Order Date' DESC;

-- Checking NULL values
SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE Title IS NULL;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE Title IS NOT NULL;

-- Sorting using 2 columns
SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
ORDER BY FirstName, LastName DESC;

-- LIKE: display all persons whose first name starts with A
SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE FirstName LIKE 'A%' -- Starts with A and % means it can have any number of characters
ORDER BY FirstName, LastName DESC;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE FirstName LIKE 'A_r%' -- A is the first character and R is the third
ORDER BY FirstName, LastName DESC;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE FirstName LIKE 'A_[b-d]%' -- A is the first character and the third must be between b and d
ORDER BY FirstName, LastName DESC;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
WHERE FirstName LIKE 'A_[^b-d]%' -- A is the first character and the third can not be between b and d
ORDER BY FirstName, LastName DESC;

SELECT DISTINCT CustomerID, SalesOrderID -- FOR ME SEEMS AWKWARD -- check it later
FROM Sales.SalesOrderHeader
ORDER BY 1;

SELECT COUNT(*)
FROM Sales.SalesOrderHeader;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person;

SELECT Top (5) BusinessEntityID, FirstName, LastName, title
FROM Person.Person;

SELECT Top (10) PERCENT BusinessEntityID, FirstName, LastName, title
FROM Person.Person;

SELECT Top (5) WITH TIES BusinessEntityID, FirstName, LastName, title -- WITH TIES: allthe values that have ties with value number 5
FROM Person.Person
ORDER BY 2;

SELECT BusinessEntityID, FirstName, LastName, title
FROM Person.Person
ORDER BY 1
OFFSET 50 ROWS FETCH NEXT 10 ROWS ONLY; -- OFFSET = SKIP, FETCH = retrieve

SELECT BusinessEntityID, FirstName, LastName, title,
		CASE Title
		WHEN 'Mr.' THEN 'Welcome'
		WHEN 'Ms.' THEN 'Most Welcome'
		ELSE 'Unknown'
		END
FROM Person.Person;

SELECT BusinessEntityID, FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person
ORDER BY 2;

SELECT BusinessEntityID, FirstName, SUBSTRING(FirstName, 1, 3),
		LEN(FirstName), LOWER(FirstName), UPPER(FirstName)
FROM Person.Person
ORDER BY 2;
