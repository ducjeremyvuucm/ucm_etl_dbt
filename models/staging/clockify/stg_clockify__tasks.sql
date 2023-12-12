with tasks as (select id as id, name as name from sources.clockify_tasks)

select *
from tasks
