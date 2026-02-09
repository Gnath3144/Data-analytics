# Data Dictionary (Template)

| Field | Description | Example | Notes |
| --- | --- | --- | --- |
| ticket_id | Unique ticket identifier | T-4441 | Primary key |
| created_at | Ticket creation timestamp | 2024-05-10 09:12 | ISO format |
| first_response_at | First response timestamp | 2024-05-10 10:02 | Derived metric |
| resolved_at | Resolution timestamp | 2024-05-11 13:45 | Derived metric |
| priority | Ticket priority | High | Standardized naming |
| assigned_team | Team responsible | Team B | From roster |
| sla_response_hours | Response SLA target | 1.0 | Hours |
| sla_resolution_hours | Resolution SLA target | 24.0 | Hours |
