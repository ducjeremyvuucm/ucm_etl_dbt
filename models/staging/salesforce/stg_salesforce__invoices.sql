# fmt: off

with invoices as (
  select
    id as invoice_id

  from
    sources.ONB2__Invoice__c

)

select * from invoices
limit 10