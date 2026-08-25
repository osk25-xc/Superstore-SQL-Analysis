-- ==========================================
-- SUPERSTORE SALES SQL ANALYSIS
-- Author: osk25-xc
-- ==========================================


-- 1. Total Sales

SELECT
    SUM(Sales) AS Total_Sales
FROM sales;


-- 2. Total Profit

SELECT
    SUM(Profit) AS Total_Profit
FROM sales;


-- 3. Total Orders

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales;


-- 4. Sales by Category

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 5. Sales by Region

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 6. Profit by Category

SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;


-- 7. Top 10 Products

SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;


-- 8. Top 10 Customers

SELECT
    Customer_ID,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;


-- 9. Monthly Sales

SELECT
    strftime('%Y-%m', Order_Date) AS Month,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Month
ORDER BY Month;


-- 10. Sales by Segment

SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 11. Profit by Region

SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;


-- 12. Average Order Value

SELECT
    AVG(Order_Total) AS Average_Order_Value
FROM (
    SELECT
        Order_ID,
        SUM(Sales) AS Order_Total
    FROM sales
    GROUP BY Order_ID
);