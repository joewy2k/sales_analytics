with orders as (select customer customer_id,
        product product_id,
        order_number,
        date,
        sales_org,
        sales_quantity,
        revenue_usd,
        discount_usd,
        costs_in_usd
  from {{source('dbt_bike_customers', 'bike_sales')}} )  

select * from orders 