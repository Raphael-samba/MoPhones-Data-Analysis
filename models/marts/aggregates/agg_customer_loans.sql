select
    l.loan_id,

    -- customer segments
    c.age_segment,
    c.income_segment,
    c.gender,

    -- loan metrics
    count(distinct l.loan_id) as total_loans,
    sum(l.balance) as total_balance,
    sum(l.total_paid) as total_paid,
    avg(l.days_past_due) as avg_days_past_due

from {{ ref('fact_loans') }} l
left join {{ ref('int_customer_segments') }} c
    on l.loan_id = c.loan_id

group by
    l.loan_id,
    c.age_segment,
    c.income_segment,
    c.gender

limit 30