/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

--which 5 products generate the highest revenue
select top 5
p.product_name,
sum(f.sales_amount)as total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue desc 

--what are the 5 worst-performing products in terms of sales
select top 5
p.product_name,
sum(f.sales_amount)as total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by p.product_name
order by total_revenue 

--which 5 subcategory generate the highest revenue
select top 5
p.subcategory,
sum(f.sales_amount)as total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by p.subcategory
order by total_revenue desc 

--what are the 5 worst-performing subcategory in terms of sales
select top 5
p.subcategory,
sum(f.sales_amount)as total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by p.subcategory
order by total_revenue 

-- using window function
select * from(
	select 
	p.subcategory,
	sum(f.sales_amount)as total_revenue,
	row_number() over(order by sum(f.sales_amount) )as rank_products
	from gold.fact_sales f
	left join gold.dim_products p
	on p.product_key=f.product_key
	group by p.subcategory
) t where rank_products <=5

-- find the top 10 customers who have generated the highest revenue 

select top 10
c.customer_key ,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
group by c.customer_key,
c.first_name,
c.last_name
order by total_revenue desc


--Find the 3 customers with the fewest orders placed

select top 3
c.customer_key,
c.first_name,
c.last_name,
count(distinct order_number) as total_orders
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
group by c.customer_key,
c.first_name,
c.last_name
order by total_orders 



