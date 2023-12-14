with
job_applications as (
    select
        id as job_application_id,
        job_id as job_id,
        is_flex as is_flex,
        user_id as user_id,
        job_date_id as job_date_id,
        job_application_status_id as job_application_status_id,

        created_at as created_at,
        updated_at as updated_at

    from
        sources.falcon_job_applications

)

select * from job_applications
