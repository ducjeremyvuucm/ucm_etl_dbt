with
    users as (
        select id as project_id, name as project_name from sources.clockify_projects
    )

select *
from users
