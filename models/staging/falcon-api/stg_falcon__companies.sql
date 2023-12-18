with companies as (
    select
        id as company_id,
        name as company_name,
        locale as locale,
        created_at as created_at,
        updated_at as updated_at,
        sales_force_ref_id as salesforce_ref_id
    from
        {{ source('sources','falcon_companies') }}
)

select * from companies
