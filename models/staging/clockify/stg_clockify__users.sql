with
    users as (
        select id as id, name as name, email as email, from sources.clockify_users
    )

select *
from users
