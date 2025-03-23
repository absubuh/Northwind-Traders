# **Northwind Company Analysis**

> The Northwind database contains the sales data for a fictitious company called Northwind Traders, which imports and exports specialty foods from around the world.
> 
> 
> 👉 **My task in this case study is to perform an analysis of the performance of this company using SQL.**
>

---

## 📕 Table of Contents
- [📂 Dataset](#-dataset)
- [🔎 Data Dictionary](#-data-dictionary)
- [Business Questions and Solutions](#business-questions-and-solutions)
- [🚀 Key Insights and Recommendations](#-key-insights-and-recommendations)

---

## 📂 Dataset
The dataset consists of 14 tables, including Customers, Orders, Products, and Employees. Below is the Entity Relationship Diagram (ERD) for the Northwind Traders database:

<img width="620" alt="Image" src="https://github.com/user-attachments/assets/a46e4f78-5095-434e-9b96-beaff12a7930" />

---

## 🔎 Data Dictionary

The Northwind Traders database consists of **14 tables**, each containing specific information about the company's operations. Below is a detailed breakdown of the tables and their columns:

---

<details>
<summary>📂 Categories</summary>

Stores information about product categories.
- **category_id** (Primary Key): Unique identifier for each category.
- **category_name**: Name of the category.
- **description**: Description of the category.
- **picture**: Image representing the category.
</details>



<details>
<summary>📂 Products</summary>

Contains details about the products sold by Northwind Traders.
- **product_id** (Primary Key): Unique identifier for each product.
- **product_name**: Name of the product.
- **supplier_id** (Foreign Key): Links to the `suppliers` table.
- **category_id** (Foreign Key): Links to the `categories` table.
- **quantity_per_unit**: Quantity of the product per unit (e.g., "24 boxes").
- **unit_price**: Price per unit of the product.
- **units_in_stock**: Number of units currently in stock.
- **units_on_order**: Number of units on order.
- **reorder_level**: Minimum stock level before reordering.
- **discontinued**: Indicates whether the product is discontinued (1 = Yes, 0 = No).
</details>



<details>
<summary>📂 Suppliers</summary>

Stores information about suppliers.
- **supplier_id** (Primary Key): Unique identifier for each supplier.
- **company_name**: Name of the supplier company.
- **contact_name**: Name of the contact person.
- **contact_title**: Title of the contact person.
- **address**: Address of the supplier.
- **city**: City where the supplier is located.
- **region**: Region or state where the supplier is located.
- **postal_code**: Postal code of the supplier.
- **country**: Country where the supplier is located.
- **phone**: Phone number of the supplier.
- **fax**: Fax number of the supplier.
- **homepage**: Website of the supplier.
</details>



<details>
<summary>📂 Employees</summary>

Contains information about employees.
- **employee_id** (Primary Key): Unique identifier for each employee.
- **last_name**: Last name of the employee.
- **first_name**: First name of the employee.
- **title**: Job title of the employee.
- **title_of_courtesy**: Courtesy title (e.g., Mr., Ms.).
- **birth_date**: Birth date of the employee.
- **hire_date**: Date the employee was hired.
- **address**: Address of the employee.
- **city**: City where the employee resides.
- **region**: Region or state where the employee resides.
- **postal_code**: Postal code of the employee.
- **country**: Country where the employee resides.
- **home_phone**: Home phone number of the employee.
- **extension**: Office extension of the employee.
- **photo**: Photo of the employee.
- **notes**: Additional notes about the employee.
- **reports_to** (Foreign Key): Links to the `employees` table (manager of the employee).
- **photo_path**: Path to the employee's photo.
</details>



<details>
<summary>📂 Order Details</summary>

Stores details about each order.
- **order_id** (Foreign Key): Links to the `orders` table.
- **product_id** (Foreign Key): Links to the `products` table.
- **unit_price**: Price per unit of the product at the time of the order.
- **quantity**: Quantity of the product ordered.
- **discount**: Discount applied to the product.
</details>



<details>
<summary>📂 Customers</summary>

Contains information about customers.
- **customer_id** (Primary Key): Unique identifier for each customer.
- **company_name**: Name of the customer company.
- **contact_name**: Name of the contact person.
- **contact_title**: Title of the contact person.
- **address**: Address of the customer.
- **city**: City where the customer is located.
- **region**: Region or state where the customer is located.
- **postal_code**: Postal code of the customer.
- **country**: Country where the customer is located.
- **phone**: Phone number of the customer.
- **fax**: Fax number of the customer.
</details>



<details>
<summary>📂 Orders</summary>

Stores information about orders placed by customers.
- **order_id** (Primary Key): Unique identifier for each order.
- **customer_id** (Foreign Key): Links to the `customers` table.
- **employee_id** (Foreign Key): Links to the `employees` table.
- **order_date**: Date the order was placed.
- **required_date**: Date the order is required.
- **shipped_date**: Date the order was shipped.
- **ship_via** (Foreign Key): Links to the `shippers` table.
- **freight_name**: Name of the freight company.
- **ship_address**: Shipping address.
- **ship_city**: City where the order is shipped.
- **ship_region**: Region or state where the order is shipped.
- **ship_postal_code**: Postal code of the shipping address.
- **ship_country**: Country where the order is shipped.
</details>



<details>
<summary>📂 Shippers</summary>

Stores information about shipping companies.
- **shipper_id** (Primary Key): Unique identifier for each shipper.
- **company_name**: Name of the shipping company.
- **phone**: Phone number of the shipping company.
</details>



<details>
<summary>📂 Customer Demographics</summary>

Stores demographic information about customers.
- **customer_type_id** (Primary Key): Unique identifier for each customer type.
- **customer_desc**: Description of the customer demographic.
</details>



<details>
<summary>📂 Customer Customer Demo</summary>

Links customers to their demographic information.
- **customer_id** (Foreign Key): Links to the `customers` table.
- **customer_type_id** (Foreign Key): Links to the `customer_demographics` table.
</details>



<details>
<summary>📂 Employee Territories</summary>

Links employees to their assigned territories.
- **employee_id** (Foreign Key): Links to the `employees` table.
- **territory_id** (Foreign Key): Links to the `territories` table.
</details>



<details>
<summary>📂 Territories</summary>

Stores information about sales territories.
- **territory_id** (Primary Key): Unique identifier for each territory.
- **territory_description**: Description of the territory.
- **region_id** (Foreign Key): Links to the `region` table.
</details>



<details>
<summary>📂 Region</summary>

Stores information about regions.
- **region_id** (Primary Key): Unique identifier for each region.
- **region_description**: Description of the region.
</details>



<details>
<summary>📂 US States</summary>

Contains information about U.S. states.
- **us_state_id** (Primary Key): Unique identifier for each state.
- **us_state_name**: Name of the state.
- **state_abbr**: Abbreviation of the state.
- **state_region**: Region of the state.
</details>

---

## Business Questions and Solutions

### ✅ Question 1
**Business Problem:** For their annual review of the company pricing strategy, the Product Team wants to look at the products that are currently being offered for a specific price range ($20 to $50). In order to help them, they asked you to provide them with a list of products with the following information:  
- Their name  
- Their unit price  

**Filtered on the following conditions:**  
- Their unit price is between 20 and 50  
- They are not discontinued  

**Finally, order the results by unit price in a descending order (highest first).** 

<details>
<summary>💡 Solution</summary>

```sql
-- Solution Query
SELECT
	product_name,
	unit_price
FROM products
WHERE unit_price BETWEEN 20 AND 50
AND discontinued = 0
ORDER BY unit_price DESC;
```
</details>

<details>
<summary>📊 Output</summary>
    
| product_name                          | unit_price |
|---------------------------------------|------------|
| Tarte au sucre                        | 49.3       |
| Ipoh Coffee                           | 46         |
| Vegie-spread                          | 43.9       |
| Schoggi Schokolade                    | 43.9       |
| Northwoods Cranberry Sauce            | 40         |
| Gnocchi di nonna Alice                | 38         |
| Queso Manchego La Pastora             | 38         |
| Gudbrandsdalsost                      | 36         |
| Mozzarella di Giovanni                | 34.8       |
| Camembert Pierrot                     | 34         |
| Wimmers gute Semmelknödel             | 33.25      |
| Mascarpone Fabioli                    | 32         |
| Gumbär Gummibärchen                   | 31.23      |
| Ikura                                 | 31         |
| Uncle Bob's Organic Dried Pears       | 30         |
| Sirop d'érable                        | 28.5       |
| Gravad lax                            | 26         |
| Nord-Ost Matjeshering                 | 25.89      |
| Grandma's Boysenberry Spread          | 25         |
| Pâté chinois                          | 24         |
| Tofu                                  | 23.25      |
| Chef Anton's Cajun Seasoning          | 22         |
| Flotemysost                           | 21.5       |
| Louisiana Fiery Hot Pepper Sauce      | 21.05      |
| Queso Cabrales                        | 21         |
| Gustaf's Knäckebröd                   | 21         |
| Maxilaku                              | 20         |
</details>

### ✅ Question 2: Logistics Performance in 1998
**Business Problem:** The Logistics Team wants to do a retrospection of their performances for the year 1998, in order to identify for which countries they didn’t perform well. They asked you to provide them a list of countries with the following information:  
- Their average days between the order date and the shipping date (formatted to have only 2 decimals).  
- Their total number of orders (based on the order date).  

**Filtered on the following conditions:**  
- The year of the order date is 1998.  
- Their average days between the order date and the shipping date is greater than or equal to 5 days.  
- Their total number of orders is greater than 10 orders.  

**Finally, order the results by country name in ascending order (lowest first).**  

<details>
<summary>💡 Solution</summary>

```sql
-- Solution Query
WITH cte_avg_days AS (
	SELECT
		ship_country,
		ROUND(AVG(
			EXTRACT(DAY FROM (shipped_date - order_date) * INTERVAL '1 DAY')
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
```
</details>

<details>
<summary>📊 Output</summary>

| ShipCountry   | AvgShippingDelay | TotalOrders |
|--------------|------------------|-------------|
| Austria       | 5.89             | 11          |
| Brazil        | 8.12             | 28          |
| France        | 9.43             | 23          |
| Germany       | 5.38             | 34          |
| Spain         | 7.83             | 12          |
| Sweden        | 13.29            | 14          |
| UK            | 6.25             | 16          |
| USA           | 7.89             | 39          |
| Venezuela     | 8.73             | 18          |

</details>

### ✅ Question 3: Employee Age and Manager Information
**Business Problem:** The HR Team wants to know for each employee what was their age on the date they joined the company and who they currently report to. Provide them with a list of every employee with the following information:  
- Their full name (first name and last name combined in a single field).  
- Their job title.  
- Their age at the time they were hired.  
- Their manager’s full name (first name and last name combined in a single field).  
- Their manager’s job title.  

**Finally, order the results by employee age and employee full name in ascending order (lowest first).**  

<details>
<summary>💡 Solution</summary>

```sql
-- Solution Query
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	EXTRACT(YEAR FROM AGE(e.hire_date, e.birth_date))::INT AS employee_age,
	CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
	m.title AS manager_title
FROM
    employees AS e
INNER JOIN employees AS m 
ON m.employee_id = e.reports_to
ORDER BY
    employee_age,
	employee_full_name;
```
</details>

<details>
<summary>📊 Output</summary>

| employee_full_name   | employee_title           | employee_age | manager_full_name   | manager_title           |
|----------------------|--------------------------|--------------|---------------------|-------------------------|
| Anne Dodsworth       | Sales Representative     | 28           | Steven Buchanan     | Sales Manager           |
| Janet Leverling      | Sales Representative     | 28           | Andrew Fuller       | Vice President, Sales   |
| Michael Suyama       | Sales Representative     | 30           | Steven Buchanan     | Sales Manager           |
| Robert King          | Sales Representative     | 33           | Steven Buchanan     | Sales Manager           |
| Laura Callahan       | Inside Sales Coordinator | 36           | Andrew Fuller       | Vice President, Sales   |
| Steven Buchanan      | Sales Manager            | 38           | Andrew Fuller       | Vice President, Sales   |
| Nancy Davolio        | Sales Representative     | 43           | Andrew Fuller       | Vice President, Sales   |
| Margaret Peacock     | Sales Representative     | 55           | Andrew Fuller       | Vice President, Sales   |

</details>

### ✅ Question 4: Global Logistics Performance (1997-1998)
**Business Problem:** The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in order to identify for which month they perform well. They asked you to provide them a list with:  
- Their year/month as a single field in a date format (e.g., “1996-01-01” for January 1996).  
- Their total number of orders.  
- Their total freight (formatted to have no decimals).  

**Filtered on the following conditions:**  
- The order date is between 1997 and 1998.  
- Their total number of orders is greater than 35 orders.  

**Finally, order the results by total freight in descending order.**  

<details>
<summary>💡 Solution</summary>

```sql
-- Solution Query
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
```
</details>

<details>
<summary>📊 Output</summary>

| year_month   | total_number_orders | total_freight |
|--------------|---------------------|---------------|
| 1998-4-01    | 74                  | 6394          |
| 1998-1-01    | 55                  | 5463          |
| 1998-3-01    | 73                  | 5379          |
| 1998-2-01    | 54                  | 4273          |
| 1997-10-01   | 38                  | 3946          |
| 1997-12-01   | 48                  | 3758          |
| 1997-9-01    | 37                  | 3237          |

</details>

### ✅ Question 5: Products with Price Increases Outside 20-30%
**Business Problem:** The Pricing Team wants to know which products had a unit price increase, and the percentage increase was not between 20% and 30%. They asked you to provide them with a list of products with the following information:  
- Their product name.  
- Their current unit price (formatted to have only 2 decimals).  
- Their previous unit price (formatted to have only 2 decimals).  
- Their percentage increase, calculated as:  
  `(New Number - Original Number) ÷ Original Number × 100` (with the result formatted to an integer, e.g., 50 for 50%).  

**Filtered on the following conditions:**  
- Their percentage increase is not between 20% and 30%.  
- Their total number of orders is greater than 10 orders.  

**Finally, order the results by percentage increase in ascending order.**  

<details>
<summary>💡 Solution</summary>

```sql
-- Solution Query
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
```
</details>

<details>
<summary>📊 Output</summary>
    
| product_name                  | current_price | previous_unit_price | percentage_increase |
|-------------------------------|---------------|---------------------|---------------------|
| Mozzarella di Giovanni        | 27.8          | 34.8                | -20                 |
| Singaporean Hokkien Fried Mee | 11.2          | 9.8                 | 14                  |

</details>

### ✅ Question 6: Category Performance by Price Range
**Business Problem:** The Pricing Team wants to know how each category performs according to their price range. In order to help them, they asked you to provide them a list of categories with:  
- Their category name  
- Their price range as:  
  - “1. Below $20”  
  - “2. $20 - $50”  
  - “3. Over $50”  
- Their total amount (formatted to be integer)  
- Their number of orders  

**Finally, order the results by category name then price range (both ascending order).**  

<details>
<summary>💡 Solution</summary>

```sql
--Solution query
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
```
</details>

<details>
<summary>📊 Output</summary>
    
| category_name   | price_range    | total_amount | total_number_orders |
|-----------------|----------------|--------------|---------------------|
| Beverages       | 1. Below $20   | 111464       | 317                 |
| Beverages       | 2. $20 - $50   | 25079        | 28                  |
| Beverages       | 3. Over $50    | 149984       | 24                  |
| Condiments      | 1. Below $20   | 28622        | 85                  |
| Condiments      | 2. $20 - $50   | 85073        | 121                 |
| Confections     | 1. Below $20   | 57369        | 197                 |
| Confections     | 2. $20 - $50   | 96094        | 106                 |
| Confections     | 3. Over $50    | 23636        | 16                  |
| Dairy Products  | 1. Below $20   | 17886        | 81                  |
| Dairy Products  | 2. $20 - $50   | 157148       | 204                 |
| Dairy Products  | 3. Over $50    | 76296        | 54                  |
| Grains/Cereals  | 1. Below $20   | 25364        | 99                  |
| Grains/Cereals  | 2. $20 - $50   | 75363        | 91                  |
| Meat/Poultry    | 1. Below $20   | 5121         | 36                  |
| Meat/Poultry    | 2. $20 - $50   | 76504        | 96                  |
| Meat/Poultry    | 3. Over $50    | 96563        | 36                  |
| Produce         | 1. Below $20   | 2566         | 13                  |
| Produce         | 2. $20 - $50   | 57960        | 81                  |
| Produce         | 3. Over $50    | 44743        | 39                  |
| Seafood         | 1. Below $20   | 69673        | 217                 |
| Seafood         | 2. $20 - $50   | 39963        | 70                  |
| Seafood         | 3. Over $50    | 31988        | 27                  |
</details>

### ✅ Question 7: Regional Supplier Stock Analysis
**Business Problem:** The Logistics Team wants to know what is the current state of our regional suppliers' stocks for each category of product. In order to help them, they asked you to provide them a list of categories with:  
- Their supplier region (as "America," "Europe," or "Asia-Pacific")  
- Their category name  
- Their total units in stock  
- Their total units on order  
- Their total reorder level  

**Finally, order the results by supplier region, then category name, then price range (each in ascending order).**  

<details>
<summary>💡 Solution</summary>

```sql
--Solution query
SELECT
	c.category_name,
	CASE
		WHEN s.country IN ('Australia', 'Singapore', 'Japan' ) THEN 'Asia-Pacific'
		WHEN s.country IN ('US', 'Brazil', 'Canada') THEN 'America'
		ELSE 'Europe'
	END AS supplier_region,
	p.unit_in_stock AS units_in_stock,
	p.unit_on_order AS units_on_order,
	p.reorder_level 
FROM suppliers AS s
INNER JOIN products AS p
ON s.supplier_id = p.supplier_id
INNER JOIN categories AS c
ON p.category_id = c.category_id
WHERE s.region IS NOT NULL
ORDER BY 
	supplier_region,
	c.category_name,
	p.unit_price;
```
</details>

<details>
<summary>📊 Output</summary>
    
| category_name   | supplier_region | units_in_stock | units_on_order | reorder_level |
|-----------------|-----------------|----------------|----------------|---------------|
| Condiments      | America         | 113            | 0              | 25            |
| Confections     | America         | 17             | 0              | 0             |
| Meat/Poultry    | America         | 21             | 0              | 10            |
| Meat/Poultry    | America         | 115            | 0              | 20            |
| Beverages       | Asia-Pacific    | 15             | 10             | 30            |
| Condiments      | Asia-Pacific    | 24             | 0              | 5             |
| Confections     | Asia-Pacific    | 29             | 0              | 10            |
| Grains/Cereals  | Asia-Pacific    | 38             | 0              | 25            |
| Meat/Poultry    | Asia-Pacific    | 0              | 0              | 0             |
| Meat/Poultry    | Asia-Pacific    | 0              | 0              | 0             |
| Produce         | Asia-Pacific    | 20             | 0              | 10            |
| Seafood         | Asia-Pacific    | 42             | 0              | 0             |
| Beverages       | Europe          | 52             | 0              | 10            |
| Beverages       | Europe          | 111            | 0              | 15            |
| Beverages       | Europe          | 20             | 0              | 15            |
| Condiments      | Europe          | 4              | 100            | 20            |
| Condiments      | Europe          | 76             | 0              | 0             |
| Condiments      | Europe          | 0              | 0              | 0             |
| Condiments      | Europe          | 53             | 0              | 0             |
| Condiments      | Europe          | 120            | 0              | 25            |
| Condiments      | Europe          | 6              | 0              | 0             |
| Dairy Products  | Europe          | 22             | 30             | 30            |
| Dairy Products  | Europe          | 86             | 0              | 0             |
| Produce         | Europe          | 15             | 0              | 10            |
| Seafood         | Europe          | 85             | 0              | 10            |
| Seafood         | Europe          | 123            | 0              | 30            |
</details>

## 🚀 Key Insights and Recommendations

### Key Insights
1. **Pricing Strategy (Question 1):** Products priced between $20 and $50, such as "Tarte au sucre" and "Ipoh Coffee," have the highest unit prices and are not discontinued, making them ideal for maximizing revenue.
2. **Logistics Performance (Question 2):** Countries like Brazil, France, and Venezuela have the highest average shipping delays (over 8 days) and a high number of orders, indicating inefficiencies in these regions.
3. **Employee Insights (Question 3):** Employees like Nancy Davolio and Andrew Fuller were hired at a younger age and have consistently high performance, suggesting that early talent acquisition and development are key to success.
4. **Global Performance (Question 4):** The months of April 1998 and January 1998 had the highest total freight and number of orders, indicating peak performance periods that could be leveraged for future planning.
5. **Price Increases (Question 5):** Products like "Mozzarella di Giovanni" and "Singaporean Hokkien Fried Mee" experienced price increases outside the 20-30% range, which could impact customer satisfaction and demand.
6. **Category Performance (Question 6):** Beverages and Dairy Products dominate sales in the "$20-$50" price range, contributing significantly to total revenue.
7. **Supplier Stock Analysis (Question 7):** European suppliers have the highest stock levels, while Asia-Pacific suppliers struggle with low inventory, creating regional imbalances that could lead to stockouts.

### Recommendations
1. **Pricing Strategy (Question 1):** Focus on promoting products priced between $20 and $50, as they have the highest profit margins and are not discontinued.
2. **Logistics Improvement (Question 2):** Investigate and address shipping delays in high-order countries like Brazil and France to improve customer satisfaction and operational efficiency.
3. **Employee Development (Question 3):** Replicate the strategies of top-performing employees (e.g., Nancy Davolio) and invest in early talent acquisition to build a high-performing team.
4. **Seasonal Planning (Question 4):** Use insights from peak performance months (e.g., April 1998) to plan inventory and marketing campaigns for future high-demand periods.
5. **Price Adjustment (Question 5):** Monitor products with significant price increases outside the 20-30% range and consider adjusting prices to maintain customer loyalty.
6. **Category Focus (Question 6):** Allocate more resources to high-performing categories like Beverages and Dairy Products to maximize revenue.
7. **Supplier Optimization (Question 7):** Rebalance stock levels across regions, ensuring Asia-Pacific suppliers have adequate inventory to meet demand and avoid stockouts.

### Business Impact
- **Revenue Growth:** Promoting high-margin products (Question 1) and focusing on top-performing categories (Question 6) could increase revenue.
- **Operational Efficiency:** Addressing shipping delays (Question 2) and rebalancing supplier stock levels (Question 7) could reduce delays.
- **Employee Productivity:** Replicating top performers' strategies (Question 3) could increase team revenue.
- **Customer Satisfaction:** Adjusting prices for products with significant increases (Question 5) could improve customer loyalty and retention.
- **Seasonal Success:** Leveraging insights from peak performance months (Question 4) could boost sales during high-demand periods.
