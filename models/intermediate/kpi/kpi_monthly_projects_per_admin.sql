with
count_projects as (
    select * from {{ ref('kpi_monthly_projects_with_jobs') }}
),

count_pms as (
    select * from {{ ref('kpi_monthly_admins_with_jobs') }}
),

kpi_month_projects_per_pm as (
    select
        p.truncated_month,
        round(p.value / pm.value, 2) as value
    from
        count_projects as p
    left join count_pms as pm on p.truncated_month = pm.truncated_month
)

select * from kpi_month_projects_per_pm
