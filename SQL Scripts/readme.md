# SQL Scripts Portfolio

A library of SQL patterns for analytics, data prep, and reporting. Each script should include a clear header and example usage.

## Folder Structure

```
SQL Scripts/
  analysis/
  data_prep/
  reporting/
  README.md
```

## Script Header Template

```
-- Purpose:
-- Inputs:
-- Outputs:
-- Notes:
```

## Example Scripts

- **Retail performance analysis**: `analysis/retail_performance.sql` aggregates revenue and margin by category and region.
- **Customer retention cohorts**: `analysis/customer_retention_cohorts.sql` calculates monthly retention rates by channel.
- **Marketing funnel conversion**: `analysis/marketing_funnel_conversion.sql` measures stage conversion by channel.
- **Data prep cleaning**: `data_prep/clean_orders.sql` standardizes order fields.
- **Weekly KPI rollup**: `reporting/weekly_kpi_rollup.sql` produces executive KPIs.

## Suggested Scripts

- **Customer LTV calculations**
- **Churn prediction feature set**
- **Inventory aging**

## SQL Best Practices

- Use CTEs for readability.
- Prefer explicit column lists.
- Add comments for business logic.
