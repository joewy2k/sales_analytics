with customer as (
    select distinct customer, 
            cust_descr, 
            city 
from {{source('dbt_bike_customers', 'bike_sales')}})
select * from customer