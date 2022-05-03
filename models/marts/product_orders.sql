with orders as (
    select * from {{ref('stg_orders')}}
),
products as (
    select * from {{ref('stg_products')}}
),

product_ordered as (
    select 
         
         p.prod_descr product,
         min(o.date) first_order_date,
         max(o.date) last_order_date,
         round(sum(coalesce(o.revenue_usd, 0)), 2) Actual_revenue ,
         round(sum(coalesce(o.discount_usd, 0) + coalesce(costs_in_usd,0)), 2) actual_cost,
         round(Actual_revenue - actual_cost, 2) profit
    from products p inner join orders o using(product_id)
    group by  prod_descr
    order by profit desc
)
select * from product_ordered