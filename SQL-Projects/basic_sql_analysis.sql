/*
Basic SQL Data Analysis Exercises
Author: Boluwatife Falola

Description:
This file contains sample SQL queries demonstrating foundational
data analysis skills including filtering, aggregation, grouping,
and joins. These exercises reflect hands-on practice completed
during SQL training and internship preparation.
*/

-- Sample table: sales_data
-- Columns: order_id, order_date, product, category, quantity, unit_price, region

-- 1. View all records
SELECT *
FROM sales_data;

-- 2. Total sales by product category
SELECT 
    category,
    SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Average order value by region
SELECT 
    region,
    AVG(quantity * unit_price) AS avg_order_value
FROM sales_data
GROUP BY region;

-- 4. Monthly sales trend
SELECT 
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(quantity * unit_price) AS monthly_sales
FROM sales_data
GROUP BY sales_month
ORDER BY sales_month;

-- 5. Products with total sales above a threshold
SELECT 
    product,
    SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY product
HAVING SUM(quantity * unit_price) > 10000
ORDER BY total_sales DESC;

-- 6. Join example: sales data with customer data
-- Sample customer table: customers (customer_id, customer_name, region)

SELECT
    c.customer_name,
    c.region,
    SUM(s.quantity * s.unit_price) AS total_spent
FROM sales_data s
JOIN customers c
    ON s.region = c.region
GROUP BY c.customer_name, c.region
ORDER BY total_spent DESC;
