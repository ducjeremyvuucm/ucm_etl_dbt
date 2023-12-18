with project_statuses as (
    select
        id as project_status_id,
        name as project_status_name

    from
        {{ source('sources','falcon_project_statuses') }}
)

select * from project_statuses
