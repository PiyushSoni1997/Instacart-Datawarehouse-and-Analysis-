SELECT aisle_id, aisle
FROM instabronze.aisle
WHERE aisle != TRIM(aisle)

SELECT aisle_id, aisle
FROM instabronze.aisle
WHERE aisle IS NULL OR aisle_id IS NULL


SELECT aisle_id, COUNT(aisle_id)
FROM instabronze.aisle
GROUP BY aisle_id
HAVING COUNT(aisle_id) > 1


------------------------------------------------------------------------------------------------------------


SELECT department_id, COUNT(department_id)
FROM instabronze.departments
GROUP BY department_id
HAVING COUNT(department_id) > 1

SELECT department_id, department
FROM instabronze.departments
WHERE department != TRIM(department)

SELECT department_id, department
FROM instabronze.departments
WHERE department IS NULL


------------------------------------------------------------------------------------------------------------


SELECT aisle_id
FROM instabronze.products
WHERE aisle_id NOT IN ( 
						SELECT aisle_id FROM instabronze.aisle)

SELECT department_id
FROM instabronze.products
WHERE department_id NOT IN ( 
						SELECT department_id FROM instabronze.aisle)


------------------------------------------------------------------------------------------------------------------------


SELECT * FROM instabronze.orders
WHERE user_id IS NULL 
	OR order_number IS NULL 
	OR order_dow IS NULL 
	OR order_hour_of_day IS NULL
	OR days_since_prior_order IS NULL