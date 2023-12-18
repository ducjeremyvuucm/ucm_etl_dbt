with user_job_dates as (
    select * from {{ ref('stg_falcon__user_job_dates') }}
    where status_id != 3
),

job_applications as (
    select * from {{ ref('stg_falcon__job_applications') }}
),

user_count as (
    select
        date_trunc(ujd.checkin_time, month) as truncated_month,
        count(distinct ja.user_id) as value
    from
        user_job_dates as ujd
    left join
        job_applications as ja
        on ujd.job_application_id = ja.job_application_id
    group by truncated_month
)

select * from user_count
where
    truncated_month > '2022-01-01'
order by truncated_month desc
