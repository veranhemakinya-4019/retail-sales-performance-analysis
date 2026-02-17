-- Total sales by region
SELECT
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Monthly sales trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;
