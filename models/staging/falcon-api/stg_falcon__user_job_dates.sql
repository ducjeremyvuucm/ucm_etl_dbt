with user_job_dates as (
    select
        id as user_job_date_id,
        job_date_id,
        job_application_id,
        status_id as status_id,
        created_at as created_at,
        updated_at,

        checkin_time,
        checkout_time

    from
        {{ source('sources','falcon_user_job_dates') }}
)

select * from user_job_dates
