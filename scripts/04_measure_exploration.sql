/*
===============================================================================
4) Measures Exploration
===============================================================================
Purpose:
    - To calculate aggregated business metrics such as totals, averages, and counts.
    - To identify overall trends or spot anomalies.


SQL Functions Used:
    - SUM
    - AVG
    - COUNT
    - DISTINCT
    - UNION / UNION ALL
===============================================================================
*/

-- Find the Total Sales
select sum(sales_amount) as total_sales from gold.fact_sales

-- Find how many items are sold
select sum(quantity)as total_quantity from gold.fact_sales 

-- Find the average selling price
select avg(price) as avg_price from gold.fact_sales

-- Find the Total number of Orders
select count(order_number) as total_orders from gold.fact_sales
select count(distinct order_number) as total_orders from gold.fact_sales  

-- Find the total number of products
select count(distinct product_key)as total_products from gold.dim_products

-- Find the total number of customers
select count(customer_key)as total_customers from gold.dim_customers

-- Find the total number of customers that has placed an order
select count(distinct customer_key)as total_order_placed from gold.fact_sales

-- Generate a Report that shows all key metrics of the business
select 'Total Sales' as measure_name,sum(sales_amount) as measure_value from gold.fact_sales
union all
select 'Total Quantity' as meaure_name,sum(quantity)as measure_value from gold.fact_sales 
union all
select 'Average Price' as measure_name,avg(price) as measure_value from gold.fact_sales
union all
select 'Total Orders' as measure_name,count(distinct order_number) as measure_vale from gold.fact_sales -- distinct eliminates duplicates 
union all
select 'Total Products' as measure_name,count(distinct product_key)as measure_value from gold.dim_products
union all
select 'Total Customers' as measure_name,count(customer_key)as measure_value from gold.dim_customers
union
select 'Total Order Placed' as measure_name,count(distinct customer_key)as measure_value from gold.fact_sales
