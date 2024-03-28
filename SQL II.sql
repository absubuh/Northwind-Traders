#Abdullah Subuh

/*
	Query 1
	What are the employees responsible for a sale (last name only), the ID of the order, the shipping name, 
    shipping country, and shipping fee for orders placed to ship to customers in the UK and Ireland?
	
	Sort these results by employee last name. Also, for readability purposes format the field names as 
    “Employee Last Name”, “Order ID”, “Freight Company”, “Destination Country”, and “Shipping Cost”, respectively
*/

SELECT LastName AS "Employee Last Name", OrderID AS "Order ID", ShipName AS "Freight Company", ShipCountry AS "Destination Country", freight AS "Shipping Cost"
  FROM Employees AS e
  INNER JOIN Orders AS o
  ON e.EmployeeID = o.EmployeeID
  WHERE ShipCountry IN ('UK', 'Ireland')
  ORDER BY e.LastName;

/*
	Query 2
	How many customers does Northwind have in each country in which they do business?
*/

SELECT COUNT(Country), Country
  FROM Customers
Group By Country
Order BY COUNT(Country) DESC;

/*
    Query 3
    What prouducts sold by Northwind have a unit price more than $20 but less than $50 and are currently in stock?
*/

SELECT ProductName, UnitPrice
  FROM Products
  WHERE UnitPrice > 20 AND UnitPrice < 50 AND UnitsInStock > 0;

/*
	Query 4
	How many of Northwind's customers are explicitly identified as "Manager" in their job title? 
    Show the individual count for all of the various "Manager" titles.
*/

SELECT Count(*), ContactTitle AS 'Contact Title'
 FROM Customers
 WHERE ContactTitle LIKE '%Manager%'
 GROUP BY ContactTitle
 ORDER BY COUNT(ContactTitle) DESC;

/*
	Query 5
	How many of Northwind's customers, that don't work in sales, are explicitly 
    identified as "Manager" in their job title? Show the individual count for all of the various "Manager" titles.
	Use a subquery in your FROM clause to filter the data on the first condition.
*/

SELECT COUNT(*), ContactTitle AS 'Contact Title'
FROM Customers
WHERE ContactTitle NOT LIKE '%sales%' AND ContactTitle IN (SELECT ContactTitle FROM Customers WHERE ContactTitle LIKE '%Manager%')
GROUP BY ContactTitle
ORDER BY COUNT(ContactTitle) DESC;


/*
    Query 6
    What is the total order price for each order listed in Northwind's database? 
    Include the Customer ID and Shipping Name for each order and sort the output by Customer ID
*/

SELECT 
    CustomerID AS 'Customer ID',
    ShipName AS 'Ship Name',
    Orders.OrderID,
    SUM(UnitPrice * Quantity) - SUM(UnitPrice * Quantity * Discount) AS 'Total Order Cost'
FROM
    OrderDetails
        JOIN
    Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY CustomerID, ShipName, Orders.OrderID
ORDER BY CustomerID;

/*
    Query 7
    Add to the previous query. Include the Title of Courtesy, First Name, and Last Name of the 
    Northwind employee responsible for each sale. Sort the output by the responsible employee's last name.
*/

SELECT 
    CustomerID AS 'Customer ID',
    ShipName AS 'Ship Name',
    Orders.OrderID,
    TitleOfCourtesy AS 'Title of Courtesy',
    FirstName AS 'First Name',
    LastName AS 'Last Name',
    SUM(UnitPrice * Quantity) - SUM(UnitPrice * Quantity * Discount) AS 'Total Order Cost'
FROM
    OrderDetails
        JOIN
    Orders ON OrderDetails.OrderID = Orders.OrderID
        JOIN
    Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY CustomerID, ShipName, Orders.OrderID, TitleOfCourtesy, FirstName, LastName
ORDER BY LastName;