with
clockify_time_entries as (
    select *
    from {{ ref("int_clockify__time_entries_reduced") }}
    where user_email in ('marcus.bageritz@ucm.agency', 'julia.hase@ucm.agency')
)

select *
from clockify_time_entries
