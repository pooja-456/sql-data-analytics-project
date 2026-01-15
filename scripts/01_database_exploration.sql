/*
===============================================================================
1) Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database by identifying available tables.
    - To inspect column details and metadata for specific tables.
    - To understand the overall schema before performing analysis.

Tables Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- Retrieves all tables available in the database to understand the overall schema
select * from information_schema.tables


-- Retrieves column details and metadata for the dim_customers table
select * from information_schema.columns
where table_name='dim_customers'
