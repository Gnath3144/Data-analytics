# Data Dictionary (Template)

| Field | Description | Example | Notes |
| --- | --- | --- | --- |
| customer_id | Unique customer identifier | C-1029 | Primary key |
| signup_date | Date of account creation | 2024-01-15 | ISO format |
| first_order_date | Date of first purchase | 2024-01-18 | Used for cohorts |
| acquisition_channel | Marketing source | Organic Search | Standardized naming |
| order_id | Unique order identifier | 30122 | Foreign key to orders |
| order_date | Date of purchase | 2024-02-10 | ISO format |
| order_amount | Revenue per order | 89.00 | In local currency |
| spend_amount | Marketing spend | 5000.00 | Per channel/month |
