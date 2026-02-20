-- ==========================================
-- SALES PERFORMANCE ANALYSIS
-- ==========================================

-- 1. View first 10 records
SELECT *
FROM sales
LIMIT 10;

-- 2. Total Revenue
SELECT 
    SUM(total_amount) AS total_revenue
FROM sales;

-- 3. Total Transactions
SELECT 
    COUNT(transaction_id) AS total_transactions
FROM sales;

-- 4. Average Order Value
SELECT 
    SUM(total_amount) / COUNT(transaction_id) AS avg_order_value
FROM sales;

-- 5. Revenue by Product Category
SELECT 
    product_category,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 6. Revenue by Gender
SELECT 
    gender,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY gender
ORDER BY total_revenue DESC;

-- 7. Monthly Revenue Trend
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 8. Top 10 Customers by Revenue
SELECT 
    customer_id,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 9. Revenue by Age Group
SELECT
    CASE
        WHEN age < 25 THEN '18-24'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY age_group
ORDER BY total_revenue DESC;