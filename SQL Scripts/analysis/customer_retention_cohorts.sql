-- Purpose:
--   Calculate monthly retention rates by acquisition channel.
-- Inputs:
--   customers(customer_id, first_order_date, acquisition_channel)
--   orders(order_id, customer_id, order_date, order_amount)
-- Outputs:
--   cohort_retention with cohort month, activity month, retention rate.
-- Notes:
--   Replace date filters and table names as needed.

WITH base_customers AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', first_order_date) AS cohort_month,
        acquisition_channel
    FROM customers
    WHERE first_order_date IS NOT NULL
),
orders_by_month AS (
    SELECT
        o.customer_id,
        DATE_TRUNC('month', o.order_date) AS order_month,
        COUNT(DISTINCT o.order_id) AS orders
    FROM orders AS o
    GROUP BY o.customer_id, DATE_TRUNC('month', o.order_date)
),
cohort_activity AS (
    SELECT
        c.cohort_month,
        c.acquisition_channel,
        o.order_month,
        COUNT(DISTINCT c.customer_id) AS active_customers
    FROM base_customers AS c
    LEFT JOIN orders_by_month AS o
        ON c.customer_id = o.customer_id
    GROUP BY c.cohort_month, c.acquisition_channel, o.order_month
),
cohort_size AS (
    SELECT
        cohort_month,
        acquisition_channel,
        COUNT(DISTINCT customer_id) AS cohort_customers
    FROM base_customers
    GROUP BY cohort_month, acquisition_channel
)
SELECT
    a.cohort_month,
    a.acquisition_channel,
    a.order_month,
    s.cohort_customers,
    a.active_customers,
    CASE
        WHEN s.cohort_customers = 0 THEN 0
        ELSE a.active_customers::DECIMAL / s.cohort_customers
    END AS retention_rate
FROM cohort_activity AS a
JOIN cohort_size AS s
    ON a.cohort_month = s.cohort_month
    AND a.acquisition_channel = s.acquisition_channel
ORDER BY a.cohort_month, a.acquisition_channel, a.order_month;
