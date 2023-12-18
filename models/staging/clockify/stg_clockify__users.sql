with
users as (
    select
        id as user_id,
        name as user_name,
        email as user_email
    from {{ source('sources','clockify_users') }}

)

select *
from users
