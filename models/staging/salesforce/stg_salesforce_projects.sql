# fmt: off

with
    projects as (
        select
            id as id,
            {{ convert_timestamp_to_unix_to_datetime('CreatedDate') }} as created_date,
            name as name,
            venue__c as location,
            account__c as account_id,
            comments__c as comments,
            start_date__c as start_date,
            End_Date__c as end_date,
            Won_or_lost_time_stamp__c as won_or_lost_date,
            Loss_Reason__c as loss_reason,
            description__c as description,
            sales_manager__c as sales_manager,
            project_volume__c as plan_volume,
            ucm_project_id__c as n_project_id,
#            case when regexp_contains(ucm_project_id__c, 'N\d{5}') then 0  as project_id,
#            {{ convert_timestamp_to_unix_to_datetime('LastReferencedDate') }} as last_referenced_date,
            Opportunity__c as opportunity_id,
            PM_Invoice_Status__c as pm_invoice_status,
            PM_Contract_Status__c as pm_contract_status,
            PM_Briefing_Status__c as pm_briefing_status,
            PM_Project_Manager__c as pm_id,
            PM_Preparation_Status__c as pm_preparation_status,



        from sources.Project__c
    )

select *
from projects
