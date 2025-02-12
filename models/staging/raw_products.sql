{{config(materialized='table')}}



select * from {{source('raw_qwt_products','products')}}