with admins as (
    select
        id as admin_id,
        email as admin_email,
        first_name,
        last_name,
        created_at,
        updated_at,
        last_login_at

    from {{ source('sources','falcon_admins') }}
)

select * from admins
