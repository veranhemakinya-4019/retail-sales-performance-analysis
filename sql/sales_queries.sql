-- =====================================================
-- SQL Data Analysis Practice
-- Author: Vera Nhema Kinya
-- Description:
-- This file contains SQL queries used to answer common
-- business questions using relational data.

-- =====================================================
-- Business Question:
-- How many orders has each customer placed?
-- =====================================================

-- Purpose:
-- Identify customer activity levels and engagement

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- =====================================================
-- Business Question:
-- Which products generate the highest revenue?
-- =====================================================

-- Purpose:
-- Support product performance analysis and prioritization

SELECT
    product_id,
    SUM(quantity * price) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC;

-- =====================================================
-- Business Question:
-- How many orders exist in total?
-- =====================================================

SELECT COUNT(*) AS total_orders
FROM orders;