-- Purpose:
--   Produce weekly KPI rollups for executive reporting.
-- Inputs:
--   orders(order_id, order_date, sales_amount, cost_amount)
-- Outputs:
--   weekly_kpis with revenue, margin, and order volume.
-- Notes:
--   Update week_start logic for your calendar definition.

SELECT
    DATE_TRUNC('week', order_date) AS week_start,
    COUNT(DISTINCT order_id) AS orders,
    SUM(sales_amount) AS revenue,
    SUM(sales_amount - cost_amount) AS margin,
    CASE
        WHEN SUM(sales_amount) = 0 THEN 0
        ELSE SUM(sales_amount - cost_amount) / SUM(sales_amount)
    END AS margin_rate
FROM orders
GROUP BY DATE_TRUNC('week', order_date)
ORDER BY week_start;
