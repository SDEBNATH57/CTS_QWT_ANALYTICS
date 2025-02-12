{% macro get_min_order_date() -%}
 
{% set min_order %}
select min(orderdate) as orderdate
from {{ ref('fct_orders') }}
order by 1
{% endset %}
 
{% set results = run_query(min_order) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}