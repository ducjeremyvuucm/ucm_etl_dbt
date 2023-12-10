with
    time_entries as (
        select timeinterval ->> duration as duration from sources.clockify_time_entries
    )

select *
from time_entries
