with invoices as (
    select
        id as invoice_id,
        'Name' as invoice_number,
        'OwnerId' as invoice_owner_id,
        isdeleted as is_deleted,
        PO_Text__c as po_text,
        PO_Number__c as po_number,
        project__c as salesforce_project_id,
        createdbyid as created_by_id,
        {{ convert_timestamp_to_unix_to_datetime('CreatedDate') }} as created_at, 
        {{ convert_timestamp_to_unix_to_datetime('LastViewedDate') }} as last_viewed_at,
        {{ convert_timestamp_to_unix_to_datetime('LastModifiedDate') }} as last_modified_at, 
        ONB2__Date__c as invoice_date,
        ON_BookingDate__c as invoice_booking_date,
        ONB2__Email__c as invoice_email,
        ONB2__Status__c as invoice_status,
        ONB2__TotalNet__c as invoice_net_amount,
        ONB2__TotalTax__c as invoice_tax_amount,
        ONB2__GrandTotal__c as invoice_grand_total,
        ONB2__Balance__c as invoice_balance,
        UCM_ProjectId__c as n_project_id,
        case when regexp_contains(UCM_ProjectId__c, 'N\\d{5}') then cast(right(regexp_extract(UCM_ProjectId__c, 'N\\d{5}'),5) as int) else cast(UCM_ProjectId__c as int) end as project_id,
        Export_DebtorNo__c as debtor_number,
        ONB2__InvoiceRun__c as invoice_run_id,
        ONB2__PaymentDue__c as due_time,
        ONB2__AccountName__c as account_name,
        ONB2__DaysOverdue__c as days_overdue,
        ONB2__PaymentDueDate__c as invoice_due_date,

    from {{ source('sources','salesforce_ONB2__Invoice__c') }}
)

select * from invoices
--limit 10
