with tags as (select id as id, name as name from sources.clockify_tags)

select *
from tags
