-- 1) Monthly sales & profit trend
SELECT
  DATEFROMPARTS(YEAR(ORDER_DATE), MONTH(ORDER_DATE), 1) AS [month],
  ROUND(SUM(SALES), 2)  AS total_sales,
  ROUND(SUM(PROFIT), 2) AS total_profit
FROM vw_sales
GROUP BY DATEFROMPARTS(YEAR(ORDER_DATE), MONTH(ORDER_DATE), 1)
ORDER BY [month];


-- 2) Month-over-Month sales growth (%)
WITH monthly_sales AS (
  SELECT
    DATEFROMPARTS(YEAR(ORDER_DATE), MONTH(ORDER_DATE), 1) AS [month],
    SUM(SALES) AS sales
  FROM vw_sales
  GROUP BY DATEFROMPARTS(YEAR(ORDER_DATE), MONTH(ORDER_DATE), 1)
),
growth AS (
  SELECT
    [month],
    sales,
    LAG(sales) OVER (ORDER BY [month]) AS prev_sales
  FROM monthly_sales
)
SELECT
  [month],
  ROUND(sales, 2) AS sales,
  ROUND(100.0 * (sales - prev_sales) / NULLIF(prev_sales, 0), 2) AS mom_growth_pct
FROM growth
ORDER BY [month];
