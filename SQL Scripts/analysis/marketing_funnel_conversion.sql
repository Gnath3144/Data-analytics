-- Purpose:
--   Measure funnel conversion rates by acquisition channel.
-- Inputs:
--   sessions(session_id, session_date, channel)
--   leads(lead_id, session_id, lead_date)
--   opportunities(opportunity_id, lead_id, stage, revenue_amount)
-- Outputs:
--   funnel_metrics with stage counts and conversion rates.
-- Notes:
--   Update stage logic to match your CRM pipeline.

WITH sessions_base AS (
    SELECT
        s.session_id,
        s.channel
    FROM sessions AS s
),
leads_base AS (
    SELECT
        l.lead_id,
        l.session_id
    FROM leads AS l
),
opps_base AS (
    SELECT
        o.opportunity_id,
        o.lead_id,
        o.stage,
        o.revenue_amount
    FROM opportunities AS o
),
counts AS (
    SELECT
        s.channel,
        COUNT(DISTINCT s.session_id) AS sessions,
        COUNT(DISTINCT l.lead_id) AS leads,
        COUNT(DISTINCT CASE WHEN o.stage IN ('Qualified', 'Proposal', 'Won') THEN o.opportunity_id END) AS qualified,
        COUNT(DISTINCT CASE WHEN o.stage = 'Won' THEN o.opportunity_id END) AS won,
        SUM(CASE WHEN o.stage = 'Won' THEN o.revenue_amount ELSE 0 END) AS won_revenue
    FROM sessions_base AS s
    LEFT JOIN leads_base AS l
        ON s.session_id = l.session_id
    LEFT JOIN opps_base AS o
        ON l.lead_id = o.lead_id
    GROUP BY s.channel
)
SELECT
    channel,
    sessions,
    leads,
    qualified,
    won,
    won_revenue,
    CASE
        WHEN sessions = 0 THEN 0
        ELSE leads::DECIMAL / sessions
    END AS session_to_lead_rate,
    CASE
        WHEN leads = 0 THEN 0
        ELSE qualified::DECIMAL / leads
    END AS lead_to_qualified_rate,
    CASE
        WHEN qualified = 0 THEN 0
        ELSE won::DECIMAL / qualified
    END AS qualified_to_won_rate
FROM counts
ORDER BY won_revenue DESC;
