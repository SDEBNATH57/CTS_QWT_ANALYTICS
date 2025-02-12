{% macro get_max_order_date() -%}
 
{% set max_order %}
select max(orderdate) as orderdate
from {{ ref('fct_orders') }}
order by 1
{% endset %}
 
{% set results = run_query(max_order) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}