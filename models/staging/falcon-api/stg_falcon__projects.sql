with projects as (
    select
        id as project_id,
        name as project_name,
        company_id as company_id,
        status_id as project_status_id,
        manager_id as admin_id,
        team_id as team_id,
        type_id as project_type_id,
        description as description,
        start_date as start_date,
        end_date as end_date,
        created_at as created_at,
        updated_at as updated_at

    from
        sources.falcon_projects
)

select * from projects
