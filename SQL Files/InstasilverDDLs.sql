IF OBJECT_ID('instasilver.aisle', 'U') IS NOT NULL
	DROP TABLE instasilver.aisle;

CREATE TABLE instasilver.aisle (
	aisle_id INT,
	aisle NVARCHAR(200)
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instasilver.departments', 'U') IS NOT NULL
	DROP TABLE instasilver.departments;

CREATE TABLE instasilver.departments (
	department_id INT,
	department NVARCHAR(200)
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instasilver.products', 'U') IS NOT NULL
	DROP TABLE instasilver.products;

CREATE TABLE instasilver.products (
	product_id INT,
	product_name NVARCHAR(200),
	aisle_id INT,
	department_id INT
	);


-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instasilver.orders', 'U') IS NOT NULL
	DROP TABLE instasilver.orders;

CREATE TABLE instasilver.orders (
	order_id INT,
	user_id INT,
	order_number INT,
	order_dow INT,
	order_hour_of_day INT,
	days_since_prior_order FLOAT
	);



-------------------------------------------------------------------------------------------------------------



IF OBJECT_ID('instasilver.order_products', 'U') IS NOT NULL
	DROP TABLE instasilver.order_products;

CREATE TABLE instasilver.order_products (
	order_id INT,
	product_id INT,
	add_to_cart_order INT,
	reordered INT
	);