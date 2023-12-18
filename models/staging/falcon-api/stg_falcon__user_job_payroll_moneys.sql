with
user_job_payroll_moneys as (

    select
        id as user_job_payroll_money_id,
        invoice_sum,
        wage_sum,
        wage_night_total,
        wage_sunday_total,
        wage_holiday_total

    from
        {{ source('sources','falcon_user_job_payroll_moneys') }}

)

select * from user_job_payroll_moneys
--limit 10
