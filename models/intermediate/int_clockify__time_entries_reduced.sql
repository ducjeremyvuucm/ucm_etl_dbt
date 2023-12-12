with
    time_entries_grouped as (
        select *
        from {{ ref("stg_clockify__time_entries") }}
        where time_start > '2023-10-28'
        group by
            time_entry_id,
            tag_ids,
            task_id,
            user_id,
            project_id,
            description,
            time_duration,
            time_start,
            time_end
    ),

    tags as (select * from {{ ref("stg_clockify__tags") }}),
    tasks as (select * from {{ ref("stg_clockify__tasks") }}),
    users as (
        select user_id, user_name, user_email
        from {{ ref("stg_clockify__users") }}
        group by user_id, user_name, user_email
    ),
    projects as (select * from {{ ref("stg_clockify__projects") }}),
    tags_unnested as (  -- unnesting the tags in tag_ids list
        select tu1.time_entry_id, json_extract_scalar(tag_id) as tag_id
        from time_entries_grouped tu1
        cross join unnest(json_extract_array(tu1.tag_ids)) as tag_id
    ),
    tags_unnested_join_tags as (  -- joining tag names 
        select tu.time_entry_id, string_agg(tg.tag_name, ", ") as tag_names
        from tags_unnested tu
        join tags tg on tg.tag_id = tu.tag_id
        group by tu.time_entry_id
    ),
    time_entries_merged as (
        select
            teg.time_entry_id,
            tujt.tag_names,
            case
                when array_length(regexp_extract_all(tujt.tag_names, 'N\\d+')) = 0
                then 'G'
                else array_to_string(regexp_extract_all(tujt.tag_names, 'N\\d+'), ', ')
            end as ucm_project_id,

            case
                when array_length(regexp_extract_all(tujt.tag_names, 'C\\d+')) = 0
                then 'G'
                else array_to_string(regexp_extract_all(tujt.tag_names, 'C\\d+'), ', ')
            end as ucm_customer_id,

            users.user_name,
            users.user_email,
            tasks.task_name,
            projects.project_name,
            teg.description,
            teg.time_duration as time_duration_string,
            coalesce(
                safe_cast(regexp_extract(teg.time_duration, 'PT(\\d+)H') as int64), 0
            ) as time_hours,
            coalesce(
                safe_cast(regexp_extract(teg.time_duration, '(\\d+)M') as int64), 0
            ) as time_minutes,
            round(
                (
                    coalesce(
                        safe_cast(
                            regexp_extract(teg.time_duration, 'PT(\\d+)H') as float64
                        ),
                        0
                    ) + coalesce(
                        safe_cast(
                            regexp_extract(teg.time_duration, '(\\d+)M') as float64
                        ),
                        0
                    )
                    / 60
                ),
                2
            ) as time_duration_decimal,
            teg.time_start,
            teg.time_end,
            cast(teg.time_start as date) as time_entry_date
        from time_entries_grouped teg
        left join tags_unnested_join_tags tujt on tujt.time_entry_id = teg.time_entry_id
        left join tasks on tasks.task_id = teg.task_id
        left join users on users.user_id = teg.user_id
        left join projects on projects.project_id = teg.project_id
    ),
    test as (
        select teg.time_entry_id, tujt.tag_names,
        from time_entries_grouped teg
        left join tags_unnested_join_tags tujt on tujt.time_entry_id = teg.time_entry_id
        left join tasks on tasks.task_id = teg.task_id
        left join users on users.user_id = teg.user_id
    )

select *
from
    time_entries_merged
    -- order by time_start
    -- limit 10
    
