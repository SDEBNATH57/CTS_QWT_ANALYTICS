{{config(materialized = 'incremental', unique_key = ['OrderID']) }}
 
select *
from
{{source("raw_qwt", 'orders')}}
 
{% if is_incremental() %}
 
where orderdate > (select max(OrderDate) from {{this}} )
 
{% endif %}