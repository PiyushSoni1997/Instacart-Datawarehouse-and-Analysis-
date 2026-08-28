# Instacart-Datawarehouse-and-Analysis-
This project focuses on analyzing the Instacart Online Grocery Shopping Dataset by building an end-to-end data analytics workflow. The project involves transforming raw transactional data into a structured data warehouse, performing business analysis using SQL, and creating interactive dashboards in Power BI.
The goal of this project is to understand customer purchasing behavior, product demand, reorder patterns, department and aisle performance, and overall shopping trends.

://Business Objectives

The project aims to answer important business questions such as:

1. What are the most frequently purchased products?
2. Which departments and aisles generate the highest number of orders?
3. What is the customer reorder rate?
4. Which products have the highest reorder frequency?
5. How often do customers place orders?
6. What are the peak ordering days and hours?
7. What is the average basket size?
8. Which product categories drive the most customer engagement?
9. How does customer purchasing behavior vary across different time periods?

# Data Warehouse Architecture

The raw Instacart data was transformed and organized into a structured data warehouse to support efficient analysis and reporting.

The warehouse combines information from multiple datasets, including:

-Orders
-Order Products 
-Products
-Aisles
-Departments

The data was structured to establish relationships between customers, orders, products, aisles, and departments, creating a centralized and analytics-ready data model.


# Project Workflow

1. Data Collection

The Instacart dataset was imported and examined to understand its structure, relationships, and key attributes.

2. Data Cleaning & Transformation

The data was prepared for analysis by handling data quality issues, validating relationships, and transforming the datasets into an appropriate structure. Data Cleaning and Transformation was done using SQl.

3. Data Warehousing

A structured data warehouse was created by integrating multiple Instacart tables. Fact and dimension-style relationships were used to organize transactional and descriptive data for efficient querying and reporting.

4. SQL Analysis

SQL was used to perform exploratory and business analysis on the warehouse.

Key SQL concepts used include:

SELECT
JOIN
GROUP BY
ORDER BY
CASE WHEN
Aggregate Functions
Common Table Expressions (CTEs)
Window Functions
Subqueries
Data Cleaning and Transformation Queries

5. Power BI Dashboard

The processed data was connected to Power BI to create an interactive dashboard for visual analysis and business insights.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

://Key KPIs

The dashboard analyzes important metrics such as:

-Total Customers
-Total Orders
-Total Products
-Total Departments
-Total Aisles
-Total Items Purchased
-Average Basket Size
-Reorder Rate
-Average Orders per Customer
-Average Days Between Orders
-Products bought together
-Support, Confidence and lift of the Basket

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

://Dashboard Insights

The Power BI dashboard provides insights into:

📦 Top Products by Number of Orders
🔄 Most Reordered Products
🏢 Orders by Department
🛍️ Orders by Aisle
📅 Orders by Day of the Week
⏰ Peak Ordering Hours
🧺 Basket Size Distribution
👥 Customer Ordering Behavior
📊 Reorder Rate Analysis
📈 Department and Product Performance

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
🛠️ Tools & Technologies
SQL – Data warehousing, querying, transformation, and business analysis
Power BI – Data modeling, DAX calculations, dashboard creation, and visualization
Excel/CSV – Source data storage and initial data exploration
Instacart Dataset – Online grocery shopping transaction data

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
://Conclusion

This project demonstrates an end-to-end analytics workflow, starting with raw Instacart transactional data and transforming it into a structured data warehouse for analysis. SQL was used to extract meaningful business insights, while Power BI was used to create interactive visualizations and dashboards.
The project highlights how data warehousing and business intelligence tools can be combined to analyze large-scale transactional data and support data-driven decision-making.
