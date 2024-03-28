#Abdullah Subuh

/*
	Query 1
	From the SQL Setup HW
*/

#SELECT *
  FROM Customers;

/*
    Query 2
    What are the unique job titles that Northwind's supplier contacts have?
*/

#SELECT DISTINCT ContactTitle
  FROM Suppliers;

/*
	Query 3
	What are the company names, customer contact names of all of Northwind's customers in London 
    (go ahead and list cities as a check)?
*/

#SELECT CompanyName, ContactName, City
  FROM Customers
  WHERE City = "London";

/*
    Query 4
    In order from largest shipping fee to smallest shipping fee, what are the id, the date the order was placed, 
    the date the order was shipped, the id of the customer who placed the order, and the shipping fee charged
    for all orders in the Northwind database?
*/

#SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
  FROM Orders
  Order BY Freight DESC;
    
/*
	Query 5
	What are the cities, companies, and contacts for Northwind's customers where the contact person works in sales, 
    sorted by company name (go ahead and include their title in the output, just to be sure)?
*/

#SELECT City, CompanyName, ContactTitle, ContactName
  FROM Customers
  Where ContactTitle Like '%Sales%'
  Order BY CompanyName;

/*
	Query 6
	To see what customers are not keeping up with the times, what companies have a fax number listed? 
    Include the contact, city, and country.
*/

#SELECT Fax, ContactName, City, Country
  FROM Customers
  Where Fax IS NOT NULL;
  

/*
	Query 7
	Generate the previous query, but limit the results to customers in Germany.
*/

#SELECT Fax, ContactName, City, Country
  FROM Customers
  Where Country = 'Germany' AND
  Fax IS NOT NULL;

/*
	Query 8
	What are the company names, contacts, city, country, and region of Northwind's customers that live in the 
    Americas (United States, Canada, Mexico, Argentina, Brazil, and Venezuela) but not in the cities of 
    Campinas, Portland, or Vancouver?
*/

#SELECT CompanyName, ContactName, ContactTitle, City, Country, Region
  FROM Customers
  Where Country IN ('USA', 'Canada', 'Mexico', 'Argentina', 'Brazil', 'Venezuela') AND
  City NOT IN ('Campinas', 'Portland', 'Vancouver');