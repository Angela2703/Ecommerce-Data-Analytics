CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

-- Top 10 Profitable Products --
SELECT product_name, SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Top 10 Customers by Sales --
SELECT customer_name, SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Region-Wise Total Sales --
SELECT region, SUM(sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY region
ORDER BY Total_Sales DESC;

-- Category-Wise Average Profit --
SELECT category, AVG(profit) AS Average_Profit
FROM ecommerce_sales
GROUP BY category
ORDER BY Average_Profit Desc;

-- Highest Discount Category --
SELECT category, AVG(discount) AS Average_Discount
FROM ecommerce_sales
GROUP BY category
ORDER BY Average_Discount Desc;

-- Orders With Negative Profits --
SELECT order_id, product_name, sales, profit
FROM ecommerce_sales
WHERE profit < 0
ORDER BY profit;

-- Monthly Sales Trend --
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales) AS total_sales
FROM ecommerce_sales
GROUP BY YEAR(order_date) , MONTH(order_date)
ORDER BY order_year , order_month;

-- Market-Wise Revenue Analysis
SELECT market, SUM(sales) AS total_revenue
FROM ecommerce_sales
GROUP BY market
ORDER BY total_revenue DESC;

-- Top Performing Sub-Categories
SELECT 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce_sales
GROUP BY sub_category
ORDER BY total_sales DESC;

-- Ship Mode Usage Analysis --
SELECT 
    ship_mode, COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
GROUP BY ship_mode
ORDER BY total_orders DESC;


/* ==========================================
   BUSINESS INSIGHTS
   E-Commerce Data Analytics Project
   ==========================================

1. PROFITABLE PRODUCTS
   Canon imageCLASS 2200 Advanced Copier
   generated the highest total profit.

2. TOP CUSTOMERS
   Tom Ashbrook was the highest-sales customer
   with total sales of 40,489.

3. REGION-WISE SALES
   Central region recorded the highest sales
   of 2,821,740.

4. CATEGORY-WISE AVERAGE PROFIT
   Technology had the highest average profit
   of 65.46.

5. DISCOUNT ANALYSIS
   Furniture had the highest average discount
   of approximately 16.80%.

6. NEGATIVE PROFIT ORDERS
   Several orders generated losses.
   Cubify CubeX 3D Printer Double Head Print
   had the most negative profit in the displayed
   results: -6,599.978.

7. MONTHLY SALES TREND
   Monthly sales were analysed across years
   2011 to 2014 to identify sales patterns.

8. MARKET-WISE REVENUE
   APAC recorded the highest revenue
   of 3,581,785.

9. SUB-CATEGORY PERFORMANCE
   Phones recorded the highest sales
   of 1,706,642, while Copiers generated
   the highest profit of 258,174.35.

10. SHIP MODE USAGE
    Standard Class was the most frequently
    used shipping mode, with 15,151 orders.

========================================== */

