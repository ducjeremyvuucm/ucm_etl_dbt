with
base_jobs as (
    select * from {{ ref('base_falcon__jobs') }}
),

base_job_statuses as (
    select * from {{ ref('base_falcon__job_statuses') }}
),

jobs as (

    select
        j.job_id,
        j.project_id,
        j.job_title,
        j.job_wage,
        j.job_price,
        j.is_flex,
        j.status_id as job_status_id,
        js.job_status_name,
        j.created_at,
        j.updated_at,
        j.description,
        j.job_type_id,
        j.slots_number,
        j.first_shift_at,
        j.last_shift_at,
        j.deadline_at



    from
        base_jobs as j
    left join base_job_statuses as js on j.status_id = js.job_status_id
)

select * from jobs
--limit 10
