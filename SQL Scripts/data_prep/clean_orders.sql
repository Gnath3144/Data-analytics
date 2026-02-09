-- Purpose:
--   Standardize order data fields for downstream analysis.
-- Inputs:
--   raw_orders(raw_order_id, order_date, product_id, region, sales_amount, cost_amount)
-- Outputs:
--   clean_orders with standardized date and numeric fields.
-- Notes:
--   Adjust casting rules to match your database.

SELECT
    raw_order_id AS order_id,
    CAST(order_date AS DATE) AS order_date,
    TRIM(product_id) AS product_id,
    INITCAP(TRIM(region)) AS region,
    CAST(sales_amount AS DECIMAL(12, 2)) AS sales_amount,
    CAST(cost_amount AS DECIMAL(12, 2)) AS cost_amount
FROM raw_orders
WHERE order_date IS NOT NULL;
