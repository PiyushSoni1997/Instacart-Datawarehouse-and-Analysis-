-- Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM instagold.orders

-- Total Products Sold by Product_id

SELECT COUNT(DISTINCT product_id) AS Total_Products
FROM instagold.orders

-- Total Products Sold by Quantity

SELECT COUNT(*) AS Total_Products_Sold
FROM instagold.orders

-- Average Basket Size

SELECT AVG(Total_Quantity) AS Avg_Quantity
FROM
	(
SELECT order_id, COUNT(*) as Total_Quantity
FROM instagold.orders
GROUP BY order_id
)t

-- Top Performing Products

SELECT TOP 10 p.product_name, COUNT(o.product_id) AS Quantity
FROM instagold.orders o
LEFT JOIN instagold.products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Quantity DESC

-- Reorder Rate

SELECT CAST(SUM(reordered) AS FLOAT) * 100 / COUNT(*) AS reorder_rate
FROM instagold.orders

-- Time Analysis (Orders By hour and Orders By day)

-- Order By Hour

SELECT order_hour_of_day, COUNT(DISTINCT(order_id)) AS hourlyorders
FROM instagold.orders
GROUP BY order_hour_of_day
ORDER BY hourlyorders DESC

-- Order By Day

SELECT order_dow, COUNT(DISTINCT(order_id)) AS hourlyorders
FROM instagold.orders
GROUP BY order_dow
ORDER BY hourlyorders DESC

-- Products sold during peak hours

SELECT TOP 20 p.product_name, o.order_hour_of_day, COUNT(o.product_id) as quantity
FROM instagold.products p
JOIN instagold.orders o
ON p.product_id = o.product_id
WHERE order_hour_of_day IN (10,11,12,13,14,15,16)
GROUP BY p.product_name, o.order_hour_of_day
ORDER BY quantity DESC

-- Aisle Performance

SELECT p.aisle, COUNT(DISTINCT o.order_id) as orders, COUNT(o.product_id) as products
FROM instagold.products p
JOIN instagold.orders o
ON p.product_id = o.product_id
GROUP BY p.aisle
ORDER BY orders DESC, products DESC

-- Dept Performance

SELECT p.department, COUNT(DISTINCT o.order_id) as orders, COUNT(o.product_id) as products
FROM instagold.products p
JOIN instagold.orders o
ON p.product_id = o.product_id
GROUP BY p.department
ORDER BY orders DESC, products DESC

-- User Loyalty KPI

SELECT user_id, COUNT(DISTINCT order_id) as orders_placed, AVG(days_since_prior_order) as avg_order_gap
FROM instagold.orders
GROUP BY user_id
ORDER BY orders_placed DESC

-- Product Reorder Rate

SELECT p.product_name, CAST(CAST(SUM(o.reordered) AS FLOAT) / COUNT(*) AS DECIMAL(10,2)) AS reorder_rate
FROM instagold.products p
JOIN instagold.orders o
ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY reorder_rate DESC

-- Top reordered Products

SELECT TOP 20 p.product_name, SUM(o.reordered) AS reorders
FROM instagold.products p
JOIN instagold.orders o
ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY reorders DESC

-- Pair Baskets

Select Top 5 * from instagold.orders
Select Top 5 * from instagold.products

WITH pair_basket AS (
SELECT o.product_id, o.order_id, p.product_name
FROM instagold.orders o
LEFT JOIN instagold.products p
ON o.product_id = p.product_id
)

SELECT TOP 20 a.product_id AS product_id_a, a.product_name AS product_a, b.product_id AS product_id_b, b.product_name AS product_b, COUNT(DISTINCT a.order_id) AS freq
FROM pair_basket a 
JOIN pair_basket b
ON a.order_id = b.order_id AND a.product_id < b.product_id

GROUP BY
    a.product_id,
    a.product_name,
    b.product_id,
    b.product_name
ORDER BY freq DESC;


-- Support Score of the Items

WITH Basket AS
(
    SELECT DISTINCT
        order_id,
        product_id
    FROM instagold.orders
),

Total_Orders AS
(
    SELECT COUNT(DISTINCT order_id) AS total_orders
    FROM instagold.orders
),

Product_Orders AS
(
    SELECT product_id,
        COUNT(DISTINCT order_id) AS total_products
    FROM instagold.orders
    GROUP BY product_id
),

Product_Pairs AS
(
    SELECT
        a.product_id AS product_id_a,
        b.product_id AS product_id_b,
        COUNT(DISTINCT a.order_id) AS freq
    FROM Basket a
    JOIN Basket b
        ON a.order_id = b.order_id
        AND a.product_id < b.product_id
    GROUP BY
        a.product_id,
        b.product_id
)

SELECT
    pp.product_id_a,
    p1.product_name AS product_a,
    pp.product_id_b,
    p2.product_name AS product_b,
    pp.freq,
    po.total_products,
    CAST(pp.freq AS FLOAT) / total_orders,
    CAST(pp.freq AS FLOAT) / po.total_products AS confidence
FROM Product_Pairs pp
JOIN instagold.products p1
    ON pp.product_id_a = p1.product_id
JOIN instagold.products p2
    ON pp.product_id_b = p2.product_id
JOIN Product_Orders po
    ON pp.product_id_a = po.product_id
CROSS JOIN Total_Orders
ORDER BY confidence ASC;



	
