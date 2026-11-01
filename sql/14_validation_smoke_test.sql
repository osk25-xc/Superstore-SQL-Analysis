-- ==========================================================
-- SUPERSTORE SQL SMOKE TEST (SQLite)
-- Purpose: validate query syntax and KPI logic on a tiny fixture.
-- This is NOT the real Superstore dataset or a project result.
-- Run in a separate scratch database/session.
-- ==========================================================

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    Order_ID TEXT,
    Order_Date TEXT,
    Customer_ID TEXT,
    Product TEXT,
    Category TEXT,
    Sales REAL,
    Profit REAL
);

INSERT INTO sales
    (Order_ID, Order_Date, Customer_ID, Product, Category, Sales, Profit)
VALUES
    ('O1', '2025-01-05', 'C1', 'P1', 'Tech', 100, 20),
    ('O2', '2025-01-12', 'C2', 'P2', 'Home', 200, 30),
    ('O3', '2025-02-03', 'C1', 'P1', 'Tech', 150, -10),
    ('O4', '2025-03-07', 'C3', 'P3', 'Home', 300, 60);

-- Expected: total_profit = 100, total_sales = 750,
-- profit_margin_pct = 13.33
SELECT
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2)
        AS profit_margin_pct
FROM sales;

-- Expected monthly rows:
-- 2025-01 | 300 | 50  | NULL
-- 2025-02 | 150 | -10 | -50.00
-- 2025-03 | 300 | 60  | 100.00
WITH monthly AS (
    SELECT
        strftime('%Y-%m', Order_Date) AS month,
        SUM(Sales) AS sales,
        SUM(Profit) AS profit
    FROM sales
    GROUP BY strftime('%Y-%m', Order_Date)
),
with_previous_month AS (
    SELECT
        month,
        sales,
        profit,
        LAG(sales) OVER (ORDER BY month) AS previous_month_sales
    FROM monthly
)
SELECT
    month,
    ROUND(sales, 2) AS sales,
    ROUND(profit, 2) AS profit,
    ROUND(
        100.0 * (sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0),
        2
    ) AS sales_growth_pct
FROM with_previous_month
ORDER BY month;

-- Negative-profit records: expected one row, O3.
SELECT Order_ID, Product, Sales, Profit
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC;

DROP TABLE sales;
