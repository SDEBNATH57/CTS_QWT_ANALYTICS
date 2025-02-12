{{config(materialized = 'view', schema = 'reporting_dev')}}

select e.country, c.companyname, c.contactname,
 count(o.orderid) as totalorders, sum(o.quantity) as totalquantity,
 sum(o.linesalesamount) as totalsales,
 avg(o.margin) as margin
 from {{ref('dim_employee')}} as e 
 inner join {{ref('fct_orders')}} as o on o.employeeid= e.empid
inner join {{ref('dim_customers')}} as c on o.customerid=c.customerid
where e.country ='{{var('v_country','France') }}'
group by e.country, c.companyname, c.contactname