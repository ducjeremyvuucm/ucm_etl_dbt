with
job_application_statuses as (
    select
        id as job_application_status_id,
        code as status_name

    from
        {{ source('sources','falcon_job_application_statuses') }}

)

select * from job_application_statuses
