CREATE OR ALTER PROCEDURE instabronze.load_instabronze AS

BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME;

	BEGIN TRY

		PRINT '-----------------------------------'
		PRINT 'LOADING BRONZE TABLE'
		PRINT '-----------------------------------'

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instabronze.aisles'
		PRINT 'BULK INSERTING instabronze.aisles'

		TRUNCATE TABLE instabronze.aisle

		BULK INSERT instabronze.aisle
		FROM 'C:\Users\piyus\OneDrive\Desktop\SQL_Files\instacart dataset\aisles.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
			)

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instabronze.departments'
		PRINT 'BULK INSERTING instabronze.departments'

		TRUNCATE TABLE instabronze.departments

		BULK INSERT instabronze.departments
		FROM 'C:\Users\piyus\OneDrive\Desktop\SQL_Files\instacart dataset\departments.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
			)
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instabronze.products'
		PRINT 'BULK INSERTING instabronze.products'

		TRUNCATE TABLE instabronze.products

		BULK INSERT instabronze.products
		FROM 'C:\Users\piyus\OneDrive\Desktop\SQL_Files\instacart dataset\products.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
			)
		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instabronze.orders'
		PRINT 'BULK INSERTING instabronze.orders'

		TRUNCATE TABLE instabronze.orders

		BULK INSERT instabronze.orders
		FROM 'C:\Users\piyus\OneDrive\Desktop\SQL_Files\instacart dataset\orders.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
			)

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'



		SET @start_time = GETDATE();
		PRINT 'TRUNCATING TABLE instabronze.order_products'
		PRINT 'BULK INSERTING instabronze.order_products'


		TRUNCATE TABLE instabronze.order_products

		BULK INSERT instabronze.order_products
		FROM 'C:\Users\piyus\OneDrive\Desktop\SQL_Files\instacart dataset\order_products__prior.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
			)

		SET @end_time = GETDATE();
		PRINT '>> Load Duration' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR(50)) + 'seconds' ;
		PRINT '-----------------------------------'
		
	END TRY
	BEGIN CATCH
		PRINT('===========================================')
		PRINT('Error occured during executing bronze layer')
		PRINT('Error Message') + ERROR_MESSAGE();
		PRINT('Error Message') + CAST(ERROR_NUMBER() AS NVARCHAR);
	END CATCH

END;