{{config(materialized = 'view' , schema = 'reporting_dev')}}
 
select
companyname,
contactname,
min(date_day) as first_order_date,
min(day_of_week_name) as first_order_day,
max(date_day) as last_order_date,
max(day_of_week_name) as last_order_day,
sum(quantity) as totalquantity,
sum(f.linesalesamount) as totalsales
from {{ref("fct_orders")}} f left join {{ref("dim_customers")}} c on f.customerid = c.customerid
left  join {{ref("dim_date")}} p on f.orderdate = p.date_day
group by companyname,contactname
order by sum(f.linesalesamount) desc