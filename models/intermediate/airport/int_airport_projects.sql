with
projects as (
    select * from {{ ref('stg_falcon__projects') }}
),

companies as (
    select * from {{ ref('stg_falcon__companies') }}
),

projects_joined_companies as (
    select
        projects.*,
        companies.company_name
    from projects
    left join companies on projects.company_id = companies.company_id
),

projects_filtered_airport_customers as (
    select *
    from projects_joined_companies as pj
    where
        pj.company_name in (
            'Gate Gourmet Lounge GmbH (0845)',
            'Eurotrade Flughafen München Handels GmbH',
            'Gebr. Heinemann SE & Co. KG',
            'Gebr. Heinemann Düsseldorf Airport Retail GmbH & Co. KG',
            'Allresto Flughafen München'
        )
)

select
    p.project_id,
    'N' || CAST(p.project_id as STRING) as n_project_id
from projects_filtered_airport_customers as p
--limit 10
