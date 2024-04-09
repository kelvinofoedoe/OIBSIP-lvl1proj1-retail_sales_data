
-- sqlcodes for project by oasisinfobyte

-- Understanding the whole dataset

-- viewing the whole dataset
SELECT *

FROM
	new_schema.customer_shopping_data;
    
-- ...................................................

-- checking for duplicates
SELECT DISTINCT
	customer_id,
    invoice_no

FROM
	new_schema.customer_shopping_data;
    
-- ....................................................

-- ANALYSIS ON WHOLE DATASET

-- number of shopping malls
SELECT DISTINCT
	shopping_mall

FROM
	new_schema.customer_shopping_data;
    
-- ...................................................

-- total sales btn 2021 and 2023
SELECT
	ROUND(SUM(price), 2)

FROM
	new_schema.customer_shopping_data;
    
-- .................................................

-- average age of customers
SELECT
	ROUND(AVG(age), 0) AS average_age

FROM
	new_schema.customer_shopping_data;
    
-- ................................................

-- customers that make the most purchases
SELECT
	age AS mode_age
FROM
	new_schema.customer_shopping_data
GROUP BY 
	age
ORDER BY
	COUNT(*) DESC
LIMIT 3;

-- ............................................

-- what item is bought the most
SELECT
	category AS mode_category
FROM
	new_schema.customer_shopping_data
GROUP BY 
	category
ORDER BY
	COUNT(*) DESC
;

-- .............................................

-- which mall is having most customers
SELECT
	shopping_mall AS mode_mall
FROM
	new_schema.customer_shopping_data
GROUP BY 
	shopping_mall
ORDER BY
	COUNT(*) DESC
;

-- ........................................

-- which mall is making the most sales
SELECT 
	shopping_mall, 
    SUM(price) AS total_sales
FROM 
	new_schema.customer_shopping_data
GROUP BY 
	shopping_mall
ORDER BY 
	total_sales DESC;
    
-- .............................................

-- which gender is making the most purchases
SELECT 
	gender, 
    SUM(price) AS total_sales
FROM 
	new_schema.customer_shopping_data
GROUP BY 
	gender
ORDER BY 
	total_sales DESC;
    
-- .........................................

-- what is male gender buying the most

SELECT 
    gender, 
    category,
    COUNT(category) AS category_purchased
FROM 
    new_schema.customer_shopping_data
WHERE 
    gender = 'Male'
GROUP BY 
    gender, 
    category
ORDER BY 
    category_purchased DESC;

-- ......................................

-- what is female gender buying most
SELECT 
    gender, 
    category,
    COUNT(category) AS category_purchased
FROM 
    new_schema.customer_shopping_data
WHERE 
    gender = 'Female'
GROUP BY 
    gender, 
    category
ORDER BY 
    category_purchased DESC;

-- .....................................

SELECT 
	STDDEV(price) AS standard_deviation
FROM
	new_schema.customer_shopping_data;

-- ..................................

-- the payment method used the most and how much money was used
SELECT
    payment_method AS mode_payment,
    SUM(price) AS total_price
FROM
    new_schema.customer_shopping_data
GROUP BY
    payment_method;
    
-- ..........................................

-- updating the invoice_date column so it appears a date data type
SET SQL_SAFE_UPDATES = 0;

UPDATE
	new_schema.customer_shopping_data
SET
	invoice_date = STR_TO_DATE(invoice_date, '%d/%m/%Y');

-- ..................................................
SELECT 
    invoice_date
FROM 
    new_schema.customer_shopping_data
WHERE
	YEAR(invoice_date) = 2021

-- ............................................

-- how much was made in each year
SELECT 
    YEAR(invoice_date) AS year_2021_to_2023,
    ROUND(SUM(price), 2) AS total_amount_spent
FROM 
    new_schema.customer_shopping_data
WHERE 
    invoice_date >= '2021-01-01' AND invoice_date <= '2021-12-31' 
    OR (invoice_date >= '2022-01-01' AND invoice_date <= '2022-12-31')
    OR (invoice_date >= '2023-01-01' AND invoice_date <= '2023-12-31')
GROUP BY 
    YEAR(invoice_date);





