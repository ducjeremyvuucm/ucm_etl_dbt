with
    payables as (
        select
            spa.id as payable_id,
            spa.type as payable_type,
            spa.description as description,
            spa.payabledate as invoice_date,
            spa.invoiceduedate as invoice_due_date,
            spa.invoicenumber as invoice_number,
            spa.exportedat as exported_at,
            spa.bookkeepingstatus as bookkeeping_status,
            spa.amount / 100 as invoice_amount,
            spa.currency as invoice_currency,
            spa.functionalamount / 100 as local_amount,
            spa.functionalcurrency as local_currency,
            spa.userid as user_id,
            spa.teamid as team_id,
            spa.teamname as team_name,
            spa.costcenterid as cost_center_id,
            spa.costcentername as cost_center_name,
            spa.companyid as company_id,
            spa.lineitems as line_items

        from sources.spendesk_payables spa
    )

select *
from payables
