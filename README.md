# Northwind Traders: Data-Driven Insights for Business Growth

## Project Overview
The Northwind Traders database contains sales data for a fictitious company that imports and exports specialty foods worldwide. My task was to analyze this data using **SQL** and **Excel** to uncover actionable insights that drive business growth, optimize pricing, and improve customer retention.

---

## 📕 Table of Contents
- 📂 Dataset  
- 🔎 Data Dictionary  
- 🧙‍♂️ Business Questions and Solutions  
- 📊 Visuals and Outputs  
- 🚀 Key Insights and Recommendations  

---

## 📂 Dataset
The dataset consists of 14 tables, including Customers, Orders, Products, and Employees. Below is the Entity Relationship Diagram (ERD) for the Northwind Traders database:

<img width="620" alt="Image" src="https://github.com/user-attachments/assets/a46e4f78-5095-434e-9b96-beaff12a7930" />

---

## 🔎 Data Dictionary
- **Customers Table:** Customer information (e.g., `CustomerID`, `CompanyName`, `ContactName`).  
- **Orders Table:** Order details (e.g., `OrderID`, `CustomerID`, `OrderDate`).  
- **Products Table:** Product information (e.g., `ProductID`, `ProductName`, `UnitPrice`).  
- **Employees Table:** Employee details (e.g., `EmployeeID`, `FirstName`, `LastName`).  
- **OrderDetails Table:** Line items for each order (e.g., `OrderID`, `ProductID`, `Quantity`).  

---

## 🧙‍♂️ Business Questions and Solutions

### ✅ Question 1: Identifying High-Value Customers
**Business Problem:** The Sales Team wants to identify high-value customers to target for loyalty programs.  
**Solution:** I analyzed customer purchase history to identify the top 10 customers contributing 30% of total revenue.  
**SQL Query:**  
```sql
SELECT 
    CustomerID, 
    CompanyName, 
    SUM(UnitPrice * Quantity) AS TotalSpent
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY CustomerID, CompanyName
ORDER BY TotalSpent DESC
LIMIT 10;
