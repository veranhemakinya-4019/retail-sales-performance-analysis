CREATE TABLE sales (
    transaction_id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

Basic Data Check
View First Rows:
SELECT *
FROM sales
LIMIT 10;

Check Total Records:
SELECT COUNT(*) AS total_rows
FROM sales;

Revenue Analysis
Total Revenue:
SELECT SUM("total_amount") AS total_revenue
FROM sales;

Total Transactions:
SELECT COUNT("transaction_id") AS total_transactions
FROM sales;

Average Order Value:
SELECT 
    SUM("total_amount") / COUNT("transaction_id") AS avg_order_value
FROM sales;

Sales by Category:
SELECT 
    "product_category",
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY "product_category"
ORDER BY total_revenue DESC;

Sales by Gender:
SELECT 
    gender,
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY gender
ORDER BY total_revenue DESC;

Monthly Sales Trend:
SELECT 
    TO_CHAR(Date, 'YYYY-MM') AS month,
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;

Top 10 Customers:
SELECT 
    "customer_id",
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY "customer_id"
ORDER BY total_revenue DESC
LIMIT 10;

Best-Selling Categories by Quantity:
SELECT 
    "product_category",
    SUM(Quantity) AS total_units_sold
FROM sales
GROUP BY "product_category"
ORDER BY total_units_sold DESC;

Age Group Segmentation:
SELECT
    CASE
        WHEN age  < 25 THEN '18-24'
        WHEN age  < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age  < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY age_group
ORDER BY total_revenue DESC;