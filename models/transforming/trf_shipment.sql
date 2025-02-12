{{config(materialized = 'table',schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select 
ss.orderid, ss.lineno, sh.companyname, ss.ShipmentDate, ss.Status
from 
{{ref('shipments_snapshot')}} as ss inner join
{{ref('lkp_shipper')}} as sh on ss.shipperid = sh.shipperid
where ss.dbt_valid_to is null