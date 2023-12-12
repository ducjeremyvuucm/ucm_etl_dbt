with
    users as (
        select id as user_id, name as user_name, user_email as email,
        from sources.clockify_users
    )

select *
from users
