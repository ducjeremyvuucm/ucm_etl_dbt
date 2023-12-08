with

    users as (
        select
            id as user_id,
            first_name as user_first_name,
            last_name as user_last_name,
            locale_id as user_locale_id,
            email as user_email,
            gender_id as user_gender_id,
            birth_date as user_birth_date,
            last_login_at as user_last_login_at,
            created_at as user_created_at,
            deleted_at as user_deleted_at,
            updated_at as user_updated_at

        from sources.falcon_users
    )

select *
from users
