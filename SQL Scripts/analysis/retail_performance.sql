-- Purpose:
--   Retail performance analysis by category and region with margin metrics.
-- Inputs:
--   orders(order_id, order_date, product_id, region, sales_amount, cost_amount)
--   products(product_id, category)
-- Outputs:
--   category_region_metrics with revenue, margin, and margin_rate.
-- Notes:
--   Replace date filters with your reporting window.

WITH base_orders AS (
    SELECT
        o.order_id,
        o.order_date,
        o.product_id,
        o.region,
        o.sales_amount,
        o.cost_amount,
        (o.sales_amount - o.cost_amount) AS margin_amount
    FROM orders AS o
    WHERE o.order_date >= DATE '2024-01-01'
),
orders_with_category AS (
    SELECT
        b.order_id,
        b.order_date,
        b.product_id,
        b.region,
        p.category,
        b.sales_amount,
        b.cost_amount,
        b.margin_amount
    FROM base_orders AS b
    LEFT JOIN products AS p
        ON b.product_id = p.product_id
)
SELECT
    category,
    region,
    COUNT(DISTINCT order_id) AS orders,
    SUM(sales_amount) AS revenue,
    SUM(margin_amount) AS margin,
    CASE
        WHEN SUM(sales_amount) = 0 THEN 0
        ELSE SUM(margin_amount) / SUM(sales_amount)
    END AS margin_rate
FROM orders_with_category
GROUP BY category, region
ORDER BY margin DESC;
