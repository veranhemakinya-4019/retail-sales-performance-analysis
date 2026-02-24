-- ===============================
-- SQL DATA ANALYSIS PRACTICE
-- Author: Vera Nhema Kinya
-- ===============================

-- 1️⃣ Total number of orders per customer
-- Business Question:
-- Which customers place the most orders?

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;


-- 2️⃣ Top-selling products by revenue
-- Business Question:
-- Which products generate the highest revenue?

SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- 3️⃣ Overall order volume
-- Business Question:
-- How many orders exist in total?

SELECT COUNT(*) AS total_orders
FROM orders;