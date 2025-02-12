{{config(materialized = 'view', schema = 'reporting_dev')}}
{% set linenumbers = [1, 2, 3, 4] %}
select
orderid,
{% for linenos in linenumbers %}
 
sum(case when lineno = {{linenos}} then linesalesamount end) as lineno{{linenos}}_amount,
 
{% endfor %}

sum(linesalesamount) as total_amount
from {{ref("fct_orders")}}
group by 1
