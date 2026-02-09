# Retail Performance (Case Study)

## Business Question

Which product categories and regions drive margin growth, and where are we losing profitability?

## Data Sources

- **Orders**: transaction-level sales data with order date, product, region, price, cost.
- **Products**: category hierarchy and unit economics.
- **Regions**: region definitions and sales territories.

> Replace the datasets above with your actual sources and note any limitations.

## Methodology (Simple Overview)

1. Cleaned orders data and standardized category names.
2. Calculated **gross margin** and **margin rate** per order.
3. Aggregated metrics by **category** and **region**.
4. Compared current period vs. previous period to spot trends.

## Key Insights (Plain Language)

- **Electronics is the top margin contributor**, but margin rate is flat—suggesting pricing pressure.
- **Home & Kitchen grew revenue**, yet margin rate declined, indicating higher discounting or costs.
- **West region profitability dropped**, driven by lower margin in two high-volume categories.

## Recommendations

- Review discount policies for Home & Kitchen to recover margin without hurting volume.
- Investigate West region supply costs and vendor terms for high-volume categories.
- Test price elasticity in Electronics to lift margin rate without losing sales.

## Next Steps

- Segment margin by customer type to identify discount leakage.
- Add shipping and return costs for a more complete profitability view.
