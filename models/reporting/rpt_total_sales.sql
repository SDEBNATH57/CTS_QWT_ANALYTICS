 
{{config(materialized = 'view' , schema = 'reporting_dev')}}
 
select
concat(e.firstname,e.lastname) as empname,
count(c.customerid) as totalcustomer,
count(p.productid) as totalproduct,
sum(f.linesalesamount) as totalsales
from {{ref("fct_orders")}} f left join {{ref("dim_customers")}} c on f.customerid = c.customerid
left  join {{ref("dim_employee")}} e on f.employeeid = e.empid
left  join {{ref("dim_products")}} p on f.productid = p.productid
group by concat(e.firstname,e.lastname)
order by sum(f.linesalesamount) desc
 
 