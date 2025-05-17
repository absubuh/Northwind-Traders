#Abdullah Subuh

/*
	Query 1
	For their annual review of the company pricing strategy, the Product Team wants to look at the products that are currently being offered for a specific price range ($20 to $50). In order to help them, they asked you to provide them with a list of products with the following information:
	- Their name
	- Their unit price
	Filtered on the following conditions:
	- Their unit price is between 20 and 50
	- They are not discontinued
	Finally, order the results by unit price in a descending order (highest first).
*/

SELECT
	product_name,
	unit_price
FROM products
WHERE unit_price BETWEEN 20 AND 50
AND discontinued = 0
ORDER BY unit_price DESC;

/*
    Query 2
    The Logistics Team wants to do a retrospection of their performances for the year 1998, in order to identify for which countries they didn’t perform well. They asked you to provide them a list of countries with the following information:
    - Their average days between the order date and the shipping date (formatted to have only 2 decimals)
    - Their total number of orders (based on the order date)
    Filtered on the following conditions:
    - The year of order date is 1998
    - Their average days between the order date and the shipping date is greater or equal 5 days
    - Their total number of orders is greater than 10 orders
    Finally, order the results by country name in an ascending order (lowest first).
*/

WITH cte_avg_days AS (
	SELECT
		ship_country,
		ROUND(AVG(
			EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY'
			)::NUMERIC,
		2) AS average_days_between_order_shipping,
		COUNT(*) AS total_number_orders
	FROM orders
	WHERE EXTRACT(YEAR FROM order_date) = 1998
	GROUP BY 
		ship_country
	ORDER BY ship_country
	)
SELECT * FROM cte_avg_days
WHERE average_days_between_order_shipping >= 5
AND total_number_orders > 10;

/*
	Query 3
	The HR Team wants to know for each employee what was their age on the date they joined the company and who they currently report to. Provide them with a list of every employee with the following information:
	- Their full name (first name and last name combined in a single field)
	- Their job title
	- Their age at the time they were hired
	- Their manager’s full name (first name and last name combined in a single field)
	- Their manager’s job title
	Finally, order the results by employee age and employee full name in an ascending order (lowest first).
*/

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	EXTRACT(YEAR FROM AGE(e.hire_date, e.birth_date)) AS employee_age,
	CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
	m.title AS manager_title
FROM
    employees AS e
INNER JOIN employees AS m 
ON m.employee_id = e.reports_to
ORDER BY
    employee_age,
	employee_full_name;

/*
    Query 4
    The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in order to identify for which month they perform well. They asked you to provide them a list with:
    - Their year/month as a single field in a date format (e.g., “1996-01-01” for January 1996)
    - Their total number of orders
    - Their total freight (formatted to have no decimals)
    Filtered on the following conditions:
    - The order date is between 1997 and 1998
    - Their total number of orders is greater than 35 orders
    Finally, order the results by total freight (descending order).
*/

WITH cte_freight AS (
	SELECT
		CONCAT(EXTRACT(YEAR FROM order_date), 
			   '-', 
			   EXTRACT(MONTH FROM order_date), 
			   '-01'
			  ) AS year_month,
		COUNT(*) AS total_number_orders,
		ROUND(
			SUM(freight)
			)::INT AS total_freight
	FROM orders
	WHERE order_date >= '1997-01-01' AND order_date < '1998-01-31'
	GROUP BY 
		CONCAT(EXTRACT(YEAR FROM order_date), 
			   '-', 
			   EXTRACT(MONTH FROM order_date), 
			   '-01'
			  )
)
SELECT * FROM cte_freight
WHERE total_number_orders > 35
ORDER BY total_freight DESC;

/*
    Query 5
    The Pricing Team wants to know which products had a unit price increase and the percentage increase was not between 20% and 30%. In order to help them, they asked you to provide them a list of products with:
    - Their product name
    - Their current unit price (formatted to have only 2 decimals)
    - Their previous unit price (formatted to have only 2 decimals)
    - Their percentage increase as:
      (New Number - Original Number) ÷ Original Number × 100 (with the result formatted to an integer, e.g., 50 for 50%)
    Filtered on the following conditions:
    - Their percentage increase is not between 20% and 30%
    - Their total number of orders is greater than 10 orders
    Finally, order the results by percentage increase (ascending order).
*/

WITH cte_price AS (
	SELECT
		d.product_id,
		p.product_name,
		ROUND(LEAD(d.unit_price) OVER (PARTITION BY p.product_name ORDER BY o.order_date)::NUMERIC,2) AS current_price,
		ROUND(LAG(d.unit_price) OVER (PARTITION BY p.product_name ORDER BY o.order_date)::NUMERIC,2) AS previous_unit_price
	FROM products AS p
	INNER JOIN order_details AS d
	ON p.product_id = d.product_id
	INNER JOIN orders AS o
	ON d.order_id = o.order_id
)
SELECT
	c.product_name,
	c.current_price,
	c.previous_unit_price,
	ROUND(100*(c.current_price - c.previous_unit_price)/c.previous_unit_price) AS percentage_increase
FROM cte_price AS c
INNER JOIN order_details AS d
ON c.product_id = d.product_id
WHERE c.current_price != c.previous_unit_price
GROUP BY 
	c.product_name,
	c.current_price,
	c.previous_unit_price
HAVING COUNT(DISTINCT d.order_id) > 10
AND ROUND(100*(c.current_price - c.previous_unit_price)/c.previous_unit_price) NOT BETWEEN 20 AND 30;

/*
    Query 6
    The Pricing Team wants to know how each category performs according to their price range. In order to help them, they asked you to provide them a list of categories with:
    - Their category name
    - Their price range as:
      - “1. Below $20”
      - “2. $20 - $50”
      - “3. Over $50”
    - Their total amount (formatted to be integer)
    - Their number of orders
    Finally, order the results by category name then price range (both ascending order).
*/

SELECT
	c.category_name,
	CASE 
		WHEN p.unit_price < 20 THEN '1. Below $20'
		WHEN p.unit_price >= 20 AND p.unit_price <= 50 THEN '2. $20 - $50'
		WHEN p.unit_price > 50 THEN '3. Over $50'
		END AS price_range,
	ROUND(SUM(d.unit_price * d.quantity)) AS total_amount,
	COUNT(DISTINCT d.order_id) AS total_number_orders
FROM categories AS c
INNER JOIN products AS p
ON c.category_id =  p.category_id
INNER JOIN order_details AS d
ON d.product_id =  p.product_id
GROUP BY 
	c.category_name,
	price_range
ORDER BY 
	c.category_name,
	price_range;

/*
    Query 7
    The Logistics Team wants to know what is the current state of our regional suppliers' stocks for each category of product. In order to help them, they asked you to provide them a list of categories with:
    - Their supplier region (as "America," "Europe," or "Asia-Pacific")
    - Their category name
    - Their total units in stock
    - Their total units on order
    - Their total reorder level
    Finally, order the results by supplier region, then category name, then price range (each in ascending order).
*/

SELECT 
    CASE 
        WHEN Country IN ('USA', 'Canada', 'Mexico') THEN 'America'
        WHEN Country IN ('Germany', 'France', 'UK') THEN 'Europe'
        ELSE 'Asia-Pacific'
    END AS SupplierRegion,
    CategoryName,
    SUM(UnitsInStock) AS TotalUnitsInStock,
    SUM(UnitsOnOrder) AS TotalUnitsOnOrder,
    SUM(ReorderLevel) AS TotalReorderLevel
FROM Suppliers
JOIN Products ON Suppliers.SupplierID = Products.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY SupplierRegion, CategoryName
ORDER BY SupplierRegion, CategoryName;
