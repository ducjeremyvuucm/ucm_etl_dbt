with tags as (
    select
        id as tag_id,
        name as tag_name
    from {{ source('sources','clockify_tags') }}
)

select *
from tags
