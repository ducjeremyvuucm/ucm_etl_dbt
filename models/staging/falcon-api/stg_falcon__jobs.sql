with jobs as (

    select
        id as job_id,
        project_id as project_id,
        title as job_title,
        wage as job_wage,
        price as job_price,
        is_flex as is_flex,
        status_id as status_id,
        created_at as created_at,
        updated_at as updated_at,
        description as description,
        job_type_id as job_type_id,
        slots_number as slots_number,
        first_shift_at as first_shift_at,
        last_shift_at as last_shift_at,
        booking_deadline_date as deadline_at



    from
        sources.falcon_jobs
)

select * from jobs
--limit 10
