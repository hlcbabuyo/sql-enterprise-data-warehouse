/*
===============================================================================
Quality Checks: Gold Layer
===============================================================================
Project: SQL Enterprise Data Warehouse
Developer: Harvie Lorenz C. Babuyo
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, 
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks AFTER successfully creating the Gold views.
    - An ideal execution returns ZERO rows.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- 1. Checking 'gold.dim_customers'
-- ====================================================================

-- >> Check for Uniqueness of Customer Key
-- Expectation: No results (Zero rows means all keys are strictly unique)
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- ====================================================================
-- 2. Checking 'gold.dim_products'
-- ====================================================================

-- >> Check for Uniqueness of Product Key
-- Expectation: No results (Zero rows means all keys are strictly unique)
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ====================================================================
-- 3. Checking 'gold.fact_sales'
-- ====================================================================

-- >> Check the Data Model Connectivity (Referential Integrity)
-- Expectation: No results (Zero rows means every sale successfully maps to a valid customer and product)
SELECT 
    * FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL 
   OR c.customer_key IS NULL;
