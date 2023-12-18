with kpi_month_users as (
    select *
    from {{ ref('kpi_monthly_user_count_with_jobs') }}
),

kpi_month_projects as (
    select *
    from {{ ref('kpi_monthly_projects_with_jobs') }}
),

kpi_month_admins as (
    select *
    from {{ ref('kpi_monthly_admins_with_jobs') }}
),

kpi_month_projects_per_pm as (
    select * from {{ ref('kpi_monthly_projects_per_admin') }}
),

joined as (
    select
        *,
        "kpi_count_users" as kpi
    from kpi_month_users
    union all
    (
        select
            *,
            "kpi_count_projects" as kpi
        from kpi_month_projects
    )
    union all
    (
        select
            *,
            "kpi_count_pm" as kpi
        from kpi_month_admins
    )
    union all
    (
        select
            *,
            "kpi_project_per_pm" as kpi
        from kpi_month_projects_per_pm

    )
)

select * from joined
