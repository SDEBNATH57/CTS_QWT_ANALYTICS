{{config(materialized = 'table' )}}
 
select 
OrderID,LineNo,ShipperID,CustomerID,ProductID,EmployeeID,
CAST(SPLIT_PART(ShipmentDate, ' ', 1) AS DATETIME) as Shipmentdate,
Status
from
{{source("raw_qwt", 'raw_shipment')}}