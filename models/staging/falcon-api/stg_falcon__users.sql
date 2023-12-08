with

    users as (
        select
            id as user_id,
            first_name as first_name,
            last_name as last_name,
            locale_id as locale_id,
            email as email,
            gender_id as gender_id,
            birth_date as birth_date,
            last_login_at as last_login_at,
            created_at as created_at,
            deleted_at as deleted_at,
            updated_at as updated_at

        from sources.falcon_users
    )

select *
from users
