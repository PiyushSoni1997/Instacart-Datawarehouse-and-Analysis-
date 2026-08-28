IF OBJECT_ID('instagold.products', 'U') IS NOT NULL
	DROP TABLE instagold.products

CREATE TABLE instagold.products (
	product_id INT,
	product_name NVARCHAR(500),
	aisle_id INT,
	aisle NVARCHAR(50),
	department_id INT,
	department NVARCHAR(50)
	)


INSERT INTO instagold.products
SELECT 
	p.product_id,
	p.product_name,
	p.aisle_id,
	a.aisle,
	p.department_id,
	d.department

FROM instasilver.products p
LEFT JOIN instasilver.aisle a
ON p.aisle_id = a.aisle_id
LEFT JOIN instasilver.departments d
ON p.department_id = d.department_id



IF OBJECT_ID('instagold.orders', 'U') IS NOT NULL
	DROP TABLE instagold.orders

CREATE TABLE instagold.orders (
	order_id INT,
	user_id INT,
	order_number INT,
	order_dow INT,
	order_hour_of_day INT,
	days_since_prior_order INT,
	product_id INT,
	add_to_cart_order INT,
	reordered INT
	)

INSERT INTO instagold.orders
SELECT 
	o.order_id,
	o.user_id,
	o.order_number,
	o.order_dow,
	o.order_hour_of_day,
	o.days_since_prior_order,
	op.product_id,
	op.add_to_cart_order,
	op.reordered
	
FROM instasilver.orders o
LEFT JOIN instasilver.order_products op
	ON o.order_id = op.order_id
