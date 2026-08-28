EXECUTE instabronze.load_instabronze

----------------------------------------------------------------------------------------------------------------------
BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME;

	BEGIN TRY
		
		
		PRINT '-----------------------------------'
		PRINT 'LOADING SILVER TABLE'
		PRINT '-----------------------------------'

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instasilver.aisle'
		PRINT 'BULK INSERTING instasilver.aisle'

		TRUNCATE TABLE instasilver.aisle
		INSERT INTO instasilver.aisle (
			aisle_id,
			aisle
			)

		SELECT 
			aisle_id,
			aisle
		FROM instabronze.aisle

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instasilver.departments'
		PRINT 'BULK INSERTING instasilver.departments'

		TRUNCATE TABLE instasilver.departments
		INSERT INTO instasilver.departments (
			department_id,
			department
			)

		SELECT 
			department_id,
			department
		FROM instabronze.departments

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instasilver.products'
		PRINT 'BULK INSERTING instasilver.products'

		TRUNCATE TABLE instasilver.products
		INSERT INTO instasilver.products (
			product_id,
			product_name,
			aisle_id,
			department_id
			)

		SELECT 
			product_id,
			TRIM(product_name),
			aisle_id,
			department_id
		FROM instabronze.products

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instasilver.orders'
		PRINT 'BULK INSERTING instasilver.orders'

		TRUNCATE TABLE instasilver.orders
		INSERT INTO instasilver.orders (
			order_id,
			user_id,
			order_number,
			order_dow,
			order_hour_of_day,
			days_since_prior_order
			)

		SELECT order_id,
			user_id,
			order_number,
			order_dow,
			order_hour_of_day,
			days_since_prior_order
		FROM instabronze.orders
		
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instasilver.order_products'
		PRINT 'BULK INSERTING instasilver.order_products'


		TRUNCATE TABLE instasilver.order_products
		INSERT INTO instasilver.order_products (
			order_id,
			product_id,
			add_to_cart_order,
			reordered
			)

		SELECT order_id,
			product_id,
			add_to_cart_order,
			reordered
		FROM instabronze.order_products

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'

	END TRY
	BEGIN CATCH
		PRINT('===========================================')
		PRINT('Error occured during executing silver layer')
		PRINT('Error Message') + ERROR_MESSAGE();
		PRINT('Error Message') + CAST(ERROR_NUMBER() AS NVARCHAR);
	END CATCH


END;