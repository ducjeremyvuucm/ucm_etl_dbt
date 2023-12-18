with
user_job_payrolls as (
    select
        id as user_job_payroll_id,
        user_job_date_id,
        user_job_payroll_money_id,
        wage,
        price,
        tarif_id,
        created_at,
        updated_at,
        invoice_id,
        payroll_id
    from
        {{ source('sources','falcon_user_job_payrolls') }}

)

select * from user_job_payrolls
--limit 10
