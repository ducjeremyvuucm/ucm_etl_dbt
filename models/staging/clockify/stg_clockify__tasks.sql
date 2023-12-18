with tasks as (
    select
        id as task_id,
        name as task_name
    from {{ source('sources','clockify_tasks') }}
)

select *
from tasks
