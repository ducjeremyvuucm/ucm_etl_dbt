with
projects as (
    select * from {{ ref('int_falcon__projects_joined_companies_and_admins') }}
),

net_amounts as (
    select * from {{ ref('int_salesforce_revenue_grouped_by_pid') }}
),

sf_projects as (
    select * from {{ ref('stg_salesforce__projects') }}
),

joined as (
    select
        p.project_id,
        p.company_name,
        p.manager,
        p.manager_email,
        p.start_date,
        p.end_date,
        na.sum_net_amount,
        sp.plan_volume
    from projects as p
    left join net_amounts as na on p.project_id = na.project_id
    left join sf_projects as sp on p.project_id = sp.project_id
    where p.project_status_id in (3, 4)

)

select * from joined
where start_date > '2022-01-01'
