with projects as (
    select * from {{ ref('stg_falcon__projects') }}
),

companies as (
    select * from {{ ref('stg_falcon__companies') }}
),

admins as (
    select * from {{ ref('stg_falcon__admins') }}
),

projects_joined as (
    select
        p.*,
        c.company_name,
        a.admin_email as manager_email,
        a.first_name || ' ' || a.last_name as manager
    from projects as p
    left join companies as c on p.company_id = c.company_id
    left join admins as a on p.admin_id = a.admin_id
)

select * from projects_joined
