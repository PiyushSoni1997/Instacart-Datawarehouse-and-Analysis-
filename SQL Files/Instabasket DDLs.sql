IF OBJECT_ID('instabronze.aisle', 'U') IS NOT NULL
	DROP TABLE instabronze.aisle;

CREATE TABLE instabronze.aisle (
	aisle_id INT,
	aisle NVARCHAR(200)
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instabronze.departments', 'U') IS NOT NULL
	DROP TABLE instabronze.departments;

CREATE TABLE instabronze.departments (
	department_id INT,
	department NVARCHAR(200)
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instabronze.products', 'U') IS NOT NULL
	DROP TABLE instabronze.products;

CREATE TABLE instabronze.products (
	product_id INT,
	product_name NVARCHAR(200),
	aisle_id INT,
	department_id INT
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instabronze.orders', 'U') IS NOT NULL
	DROP TABLE instabronze.orders;

CREATE TABLE instabronze.orders (
	order_id INT,
	user_id INT,
	eval_set NVARCHAR(50),
	order_number INT,
	order_dow INT,
	order_hour_of_day INT,
	days_since_prior_order FLOAT
	);



-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instabronze.order_products', 'U') IS NOT NULL
	DROP TABLE instabronze.order_products;

CREATE TABLE instabronze.order_products (
	order_id INT,
	product_id INT,
	add_to_cart_order INT,
	reordered INT
	);



