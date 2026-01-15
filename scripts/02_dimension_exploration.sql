/*
===============================================================================
2) Dimensions Exploration
===============================================================================
Purpose:
    - To explore and analyze the key dimension attributes.

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Retrieves the list of unique countries from which customers originate
select distinct country from gold.dim_customers
  
  -- Retrieves a list of unique product categories, subcategories, and product names
select distinct category,subcategory , product_name from gold.dim_products
order by 1,2,3
