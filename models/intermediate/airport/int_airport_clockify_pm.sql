with
hour_wage as (
    select * from {{ ref('seed_airport_cost_hour_emp') }}
),

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

),

time_entries_joined as (
    select
        te.*,
        hw.cost_per_hour,
        round(te.time_duration_decimal * hw.cost_per_hour, 2) as time_cost
    from clockify_time_entries as te
    left join hour_wage as hw on te.user_email = hw.email
)

select *
from time_entries_joined
