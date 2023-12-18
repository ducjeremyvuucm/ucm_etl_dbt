with user_job_dates as (
    select *
    from {{ ref('stg_falcon__user_job_dates') }}
    where status_id != 3
),

job_applications as (
    select * from {{ ref('stg_falcon__job_applications') }}
),

jobs as (
    select * from {{ ref('stg_falcon__jobs') }}
),

projects as (
    select *
    from {{ ref('stg_falcon__projects') }}
    where project_status_id in (3, 4)
),

admins as (
    select *
    from {{ ref('stg_falcon__admins') }}

),

project_count as (
    select
        date_trunc(ujd.checkin_time, month) as truncated_month,
        count(distinct a.admin_id) as value
    from
        user_job_dates as ujd
    left join
        job_applications as ja
        on ujd.job_application_id = ja.job_application_id
    left join
        jobs as j
        on ja.job_id = j.job_id
    left join
        projects as p
        on j.project_id = p.project_id
    left join
        admins as a
        on p.admin_id = a.admin_id
    where
        a.admin_email not in (
            'amin@ucastme.de',
            'amin.guellil@ucm.agency',
            'christoph.keding@ucastme.de',
            'franziska.seitz@ucastme.de',
            'esther.widmann@ucastme.de',
            'cj.villarubia@ucm.agency'
        )
    group by truncated_month
)

select * from project_count
where
    truncated_month > '2022-01-01'
order by truncated_month desc
