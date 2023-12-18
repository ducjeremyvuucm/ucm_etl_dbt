with
airport_spend as (
    select
        local_amount as local_amount,
        CAST(invoice_date as date) as invoice_date
    from {{ ref('stg_spendesk__payables') }}
    where cost_center_name in ('BER - 2211', 'MUC - 2222', 'HAM - 2244')
)

select *
from airport_spend
