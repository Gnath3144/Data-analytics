# Operations SLA Monitoring (Case Study)

## Business Question

Which teams miss SLAs most frequently, and what drives delays?

## Data Sources

- **Tickets**: ticket creation, resolution date, priority, assigned team.
- **SLA Targets**: response and resolution targets by priority.
- **Agent Roster**: team capacity and shift coverage.

> Replace the datasets above with your actual sources and note any limitations.

## Methodology (Simple Overview)

1. Calculated **time to first response** and **time to resolution**.
2. Compared actual times to SLA targets by priority.
3. Analyzed SLA misses by team and time of day.

## Key Insights (Plain Language)

- **High-priority tickets miss SLA during peak hours**, indicating staffing gaps.
- **Team B resolves slower** due to higher backlog volume.
- **Weekend coverage is thin**, leading to response delays.

## Recommendations

- Add peak-hour staffing for high-priority coverage.
- Rebalance backlog distribution across teams.
- Adjust weekend shifts or add on-call coverage.

## Next Steps

- Identify recurring issue categories to reduce ticket volume.
- Track SLA improvements after staffing changes.
