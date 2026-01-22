select
    cs.age_segment,
    l.account_status_l1 as credit_outcome,

    -- customer experience
    avg(n.nps_score) as avg_nps,
    count(n.nps_score) as total_responses,

    -- payment recovery
    sum(l.total_paid) as total_paid,
    sum(l.total_due_today) as total_due,
    sum(l.total_paid)
        / nullif(sum(l.total_due_today), 0) as recovery_rate

from {{ ref('int_loans') }} l
left join {{ ref('int_customer_segments') }} cs
    on l.loan_id = cs.loan_id
left join {{ ref('stg_nps') }} n
    on l.loan_id = n.loan_id

group by
    cs.age_segment,
    l.account_status_l1

order by
    cs.age_segment,
    l.account_status_l1