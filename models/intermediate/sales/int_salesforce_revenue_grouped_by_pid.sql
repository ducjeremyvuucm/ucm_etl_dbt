with revenue as (
    select * from {{ ref('stg_salesforce__invoices') }}
),

revenue_grouped as (
    select
        project_id,
        sum(invoice_net_amount) as sum_net_amount
    from revenue where invoice_status in ('Open', 'Paid')
    group by project_id

)

select * from revenue_grouped
