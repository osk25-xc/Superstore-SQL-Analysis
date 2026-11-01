-- ==========================================================
-- SUPERSTORE: PROFITABILITY AND MONTHLY GROWTH
-- SQL dialect: SQLite (uses strftime)
-- Expected table: sales
-- ==========================================================

-- 1. Overall profit margin.
-- Margin is calculated from aggregated profit and sales,
-- not as an average of row-level margin percentages.
SELECT
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0), 2)
        AS profit_margin_pct
FROM sales;

-- 2. Profitability by category.
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM sales
GROUP BY Category
ORDER BY total_profit DESC;

-- 3. Monthly sales and profit.
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

-- 4. Orders with negative profit.
-- Review these records before recommending pricing or discount changes.
SELECT
    Order_ID,
    Order_Date,
    Customer_ID,
    Product,
    Sales,
    Profit
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC;
