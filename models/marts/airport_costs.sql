with
clockify_pm as (
    select
        time_entry_date as date,
        sum(time_cost) as cost_pm
    from {{ ref('int_airport_clockify_pm') }}
    group by date
),

clockify_staff as (
    select
        time_entry_date as date,
        sum(time_cost) as cost_staff
    from {{ ref('int_airport_clockify_staff') }}
    group by date
),

spendesk as (
    select
        invoice_date as date,
        sum(local_amount) as cost_spendesk
    from {{ ref('int_spend_spendesk_airport') }}
    group by date
),

joined_cost as (
    select
        coalesce(pm.cost_pm, 0) as cost_pm,
        coalesce(st.cost_staff, 0) as cost_staff,
        coalesce(sp.cost_spendesk, 0) as cost_spendesk,
        coalesce(pm.cost_pm, 0)
        + coalesce(st.cost_staff, 0)
        + coalesce(sp.cost_spendesk, 0) as total_cost,
        coalesce(pm.date, st.date, sp.date) as date

    from clockify_pm as pm
    full outer join clockify_staff as st on pm.date = st.date
    full outer join spendesk as sp on pm.date = sp.date
)

select * from joined_cost
