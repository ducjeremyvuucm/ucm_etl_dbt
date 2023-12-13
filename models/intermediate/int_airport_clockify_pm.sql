with

clockify_time_entries as (
    select *
    from {{ ref("int_clockify__time_entries_reduced") }}
    where
        user_email in (
            'joost.klemm@ucm.agency',
            'sophia.reschke@ucm.agency',
            'maximilian.behlke@ucm.agency'
        )
        and ucm_project_id in (
            select n_project_id from {{ ref('int_airport_projects') }}
        )

)

select *
from clockify_time_entries
