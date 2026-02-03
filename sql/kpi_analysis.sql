-- 1) Overall business KPIs
SELECT
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit,
  COUNT(DISTINCT ORDER_ID) AS total_orders,
  COUNT(DISTINCT CUSTOMER_ID) AS total_customers,
  CAST(SUM(PROFIT) / NULLIF(SUM(SALES), 0) AS DECIMAL(10,4)) AS profit_margin
FROM vw_sales;


-- 2) Average Order Value (AOV) + Average Profit per Order
WITH order_totals AS (
  SELECT
    ORDER_ID,
    SUM(SALES)  AS order_sales,
    SUM(PROFIT) AS order_profit
  FROM vw_sales
  GROUP BY ORDER_ID
)
SELECT
  CAST(AVG(order_sales)  AS DECIMAL(12,2)) AS avg_order_value,
  CAST(AVG(order_profit) AS DECIMAL(12,2)) AS avg_profit_per_order
FROM order_totals;


-- 3) Shipping lead time (days between order and ship) by ship mode
SELECT
  SHIP_MODE,
  CAST(AVG(DATEDIFF(day, ORDER_DATE, SHIP_DATE)) AS DECIMAL(10,2)) AS avg_ship_days
FROM vw_sales
GROUP BY SHIP_MODE
ORDER BY avg_ship_days;
