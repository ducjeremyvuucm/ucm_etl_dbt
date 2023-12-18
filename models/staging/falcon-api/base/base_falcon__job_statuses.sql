with jobs_statuses as (

    select
        id as job_status_id,
        name as job_status_name


    from
        {{ source('sources','falcon_job_statuses') }}
)

select * from jobs_statuses
--limit 10
