/*
===============================================================================
7) Change Over Time Analysis
===============================================================================
Purpose:
    - To track how business performance changes over time.
    - To identify trends, growth patterns, and fluctuations in sales activity.
    - To support time-based reporting and highlight periods of growth or decline.

SQL Functions Used:
    - YEAR()
    - MONTH()
    - DATETRUNC()
    - SUM()
    - COUNT(DISTINCT)
===============================================================================
*/

-- Analyze sales performance over time(year)
select 
year(order_date) as order_year, 
sum( sales_amount) as total_sales,
count(distinct customer_key)as total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date)
order by year(order_date)

-- Analyze sales performance over time(month)
select 
month(order_date) as order_month, 
sum( sales_amount) as total_sales,
count(distinct customer_key)as total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by month(order_date)
order by month(order_date)



-- Analyze sales performance over time(year,month)
select 
year(order_date)as order_year,
month(order_date) as order_month, 
sum( sales_amount) as total_sales,
count(distinct customer_key)as total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date),month(order_date)
order by year(order_date), month(order_date)

--datetrunc()
select 
datetrunc(month,order_date)as order_date,
sum( sales_amount) as total_sales,
count(distinct customer_key)as total_customers,
sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by datetrunc(month,order_date)
order by datetrunc(month,order_date)
