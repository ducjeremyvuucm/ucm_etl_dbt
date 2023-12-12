with
    airport_spend as (
        select invoice_date as invoice_date, local_amount as local_amount
        from sources.stg_spendesk__payables
        where cost_center_name in ('BER - 2211', 'MUC - 2222', 'HAM - 2244')
    )

select *
from airport_spend
