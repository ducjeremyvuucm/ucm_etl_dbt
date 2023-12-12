with
    time_entries as (
        select *
        from {{ ref("stg_clockify__time_entries") }}
        where time_start > '2023-10-28'
    )

select *
from
    time_entries
    /*order by time_start 
limit 10
*/
    
