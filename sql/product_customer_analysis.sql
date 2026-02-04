-- 1) Category performance
SELECT
  CATEGORY,
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit,
  CAST(SUM(PROFIT) / NULLIF(SUM(SALES), 0) AS DECIMAL(10,4)) AS profit_margin
FROM vw_sales
GROUP BY CATEGORY
ORDER BY total_sales DESC;


-- 2) Top 10 subcategories by sales
SELECT TOP 10
  SUBCATEGORY,
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit,
  CAST(SUM(PROFIT) / NULLIF(SUM(SALES), 0) AS DECIMAL(10,4)) AS profit_margin
FROM vw_sales
GROUP BY SUBCATEGORY
ORDER BY total_sales DESC;


-- 3) High sales but negative profit (risk areas)
SELECT
  SUBCATEGORY,
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit
FROM vw_sales
GROUP BY SUBCATEGORY
HAVING SUM(PROFIT) < 0
ORDER BY total_sales DESC;


-- 4) Customer segment contribution
SELECT
  SEGMENT,
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit,
  COUNT(DISTINCT CUSTOMER_ID) AS customer_count
FROM vw_sales
GROUP BY SEGMENT
ORDER BY total_sales DESC;


-- 5) Repeat customer rate
WITH customer_orders AS (
  SELECT
    CUSTOMER_ID,
    COUNT(DISTINCT ORDER_ID) AS order_count
  FROM vw_sales
  GROUP BY CUSTOMER_ID
)
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
  CAST(
    1.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(*)
    AS DECIMAL(10,4)
  ) AS repeat_rate
FROM customer_orders;
