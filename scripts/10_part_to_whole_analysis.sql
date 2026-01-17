/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/

--which category contribute the most to the overall sales
with category_sales as(
select 
p.category,
sum(f.sales_amount) as total_sales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by category
)
select 
category,
total_sales,
sum(total_sales)over() overall_sales,
concat(round((cast(total_sales as float) /sum(total_sales)over() )*100,2),'%')as percentage_of_total
from category_sales
order by total_sales desc

--which subcategory contribute the most to the overall sales
with subcategory_sales as(
select 
p.subcategory,
sum(f.sales_amount) as total_sales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by subcategory
)
select 
subcategory,
total_sales,
sum(total_sales)over() overall_sales,
concat(round((cast(total_sales as float) /sum(total_sales)over() )*100,2),'%')as percentage_of_total
from subcategory_sales
order by total_sales desc
