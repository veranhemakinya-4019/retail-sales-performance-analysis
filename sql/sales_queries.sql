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

STEP 1: Basic Data Check
View First Rows:
SELECT *
FROM sales
LIMIT 10;

Check Total Records:
SELECT COUNT(*) AS total_rows
FROM sales;

STEP 2: Revenue Analysis
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

STEP 3: Sales by Category
SELECT 
    "product_category",
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY "product_category"
ORDER BY total_revenue DESC;

STEP 4: Sales by Gender
SELECT 
    gender,
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY gender
ORDER BY total_revenue DESC;

STEP 5: Monthly Sales Trend
SELECT 
    TO_CHAR(Date, 'YYYY-MM') AS month,
    SUM("total_amount") AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;