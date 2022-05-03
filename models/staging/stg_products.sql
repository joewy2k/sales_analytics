with product as (select distinct  product product_id,
       prod_descr,
       prod_cat, 
       cat_descr,
       division
       
from {{source('dbt_bike_customers', 'bike_sales')}})
select * from product