# Data Dictionary (Template)

| Field | Description | Example | Notes |
| --- | --- | --- | --- |
| order_id | Unique order identifier | 100045 | Primary key |
| order_date | Date of purchase | 2024-03-18 | ISO format |
| product_id | Product identifier | P-302 | Foreign key to products |
| category | Product category | Electronics | Standardized naming |
| region | Sales region | West | Territory label |
| sales_amount | Revenue for the order | 250.00 | In local currency |
| cost_amount | Cost of goods sold | 170.00 | Include freight if available |
| margin_amount | sales_amount - cost_amount | 80.00 | Calculated |
| margin_rate | margin_amount / sales_amount | 0.32 | Calculated |
