with
    time_entries as (
        select
            id as id,
            tagids as tag_ids,
            taskid as task_id,
            userid as user_id,
            projectid as project_id,
            description as description,
            json_extract(timeinterval, "$.duration") as time_duration,
            json_extract(timeinterval, "$.start") as time_start,
            json_extract(timeinterval, "$.end") as time_end,
        from sources.clockify_time_entries
    )

select *
from time_entries
