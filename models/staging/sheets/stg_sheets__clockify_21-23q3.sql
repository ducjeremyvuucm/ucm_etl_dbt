with clockify_old as (
    select
        'Date' as date_,
        'Tags' as tags,
        'Task' as task,
        'User' as user_name,
        'Year' as year,
        'Email' as user_email,
        'Group' as group_,
        'Project' as project,
        'End_Date' as end_date,
        'End_Time' as end_time

    from
        sources.sheets_clockify_21_23_q3_detailed_report
)

select * from clockify_old
limit 10
