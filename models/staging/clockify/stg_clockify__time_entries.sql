with
    time_entries as (
        select
            id as time_entry_id,

            -- the following needs to be converted as a string, because the source
            -- contains duplicate values. in the intermediate stage, for
            -- int_clockify__time_entries, the tag_ids are exloded and 
            -- grouped again.
            --
            to_json_string(tagids) as tag_ids,

            taskid as task_id,
            userid as user_id,
            projectid as project_id,
            description as description,
            json_extract_scalar(timeinterval, "$.duration") as time_duration,
            parse_datetime(
                '%Y-%m-%dT%H:%M:%E*SZ', json_extract_scalar(timeinterval, "$.start")
            ) as time_start,
            parse_datetime(
                '%Y-%m-%dT%H:%M:%E*SZ', json_extract_scalar(timeinterval, "$.end")
            ) as time_end,
        from sources.clockify_time_entries
    )

select *
from
    time_entries
    -- limit 10
    
