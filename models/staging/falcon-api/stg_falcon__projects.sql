with
base_projects as (
    select * from {{ ref('base_falcon__projects') }}
),

base_project_statuses as (
    select * from {{ ref('base_falcon__project_statuses') }}
),

projects as (
    select
        p.project_id,
        p.project_name,
        p.company_id,
        p.project_status_id,
        ps.project_status_name,
        p.admin_id,
        p.team_id,
        p.project_type_id,
        p.description,
        p.start_date,
        p.end_date,
        p.created_at,
        p.updated_at

    from
        base_projects as p
    left join
        base_project_statuses as ps
        on p.project_status_id = ps.project_status_id
)

select * from projects
--limit 10
