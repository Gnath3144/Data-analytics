# Data Dictionary (Template)

| Field | Description | Example | Notes |
| --- | --- | --- | --- |
| session_id | Unique session identifier | S-88731 | Primary key |
| session_date | Date of session | 2024-04-02 | ISO format |
| channel | Acquisition channel | Paid Search | Standardized naming |
| lead_id | Lead identifier | L-5521 | Foreign key to leads |
| lead_date | Date lead was created | 2024-04-02 | ISO format |
| lead_score | Lead quality score | 82 | 0-100 scale |
| opportunity_id | Opportunity identifier | O-998 | Foreign key to opportunities |
| stage | Pipeline stage | Qualified | Standardized naming |
| revenue_amount | Won revenue | 12000.00 | In local currency |
