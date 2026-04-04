/*
===============================================================================
Quality Checks: Silver Layer
===============================================================================
Project: Enterprise ERP & CRM Data Warehouse
Developer: Harvie Lorenz C. Babuyo
===============================================================================
Script Purpose:
    This script acts as a QA auditor. It performs various data profiling and 
    quality checks across the 'silver' layer to ensure transformations from 
    the bronze layer were applied successfully.

    Checks include:
    - Null or duplicate primary keys.
    - Unwanted trailing/leading spaces in string fields.
    - Data standardization and categorical consistency.
    - Invalid date ranges and temporal logic (e.g., Start Date > End Date).
    - Mathematical consistency between related fields (Sales = Qty * Price).

Usage Notes:
    - Run these checks AFTER successfully executing `silver.load_silver`.
    - An ideal execution returns ZERO rows for anomaly checks.
    - Investigate and resolve any discrepancies by updating the ETL stored procedure.
===============================================================================
*/

-- ====================================================================
-- 1. Checking 'silver.crm_cust_info'
-- ====================================================================

-- >> Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    cst_id,
    COUNT(*) AS count_of_records
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- >> Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- >> Data Standardization & Consistency (Profiling)
-- Expectation: Only clean categories (e.g., 'Single', 'Married', 'n/a')
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;


-- ====================================================================
-- 2. Checking 'silver.crm_prd_info'
-- ====================================================================

-- >> Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    prd_id,
    COUNT(*) AS count_of_records
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- >> Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- >> Check for NULLs or Negative Values in Cost
-- Expectation: No Results
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- >> Data Standardization & Consistency (Profiling)
-- Expectation: Only clean categories ('Mountain', 'Road', etc.)
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- >> Check for Invalid Date Orders
-- Expectation: No Results (A product cannot end before it starts)
SELECT 
    * FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- ====================================================================
-- 3. Checking 'silver.crm_sales_details'
-- ====================================================================

-- >> Check for Invalid Dates (Out of bounds)
-- Expectation: No Results
SELECT 
    sls_due_dt 
FROM silver.crm_sales_details
WHERE sls_due_dt > '2050-01-01' 
   OR sls_due_dt < '1900-01-01';

-- >> Check for Invalid Temporal Logic
-- Expectation: No Results (You cannot ship something before it is ordered)
SELECT 
    * FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- >> Check Data Consistency: Sales = Quantity * Price
-- Expectation: No Results (Mathematical anomalies)
SELECT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;


-- ====================================================================
-- 4. Checking 'silver.erp_cust_az12'
-- ====================================================================

-- >> Identify Out-of-Range Dates
-- Expectation: Birthdates between 1924-01-01 and Today. No Results.
SELECT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- >> Data Standardization & Consistency (Profiling)
-- Expectation: 'Male', 'Female', 'n/a'
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;


-- ====================================================================
-- 5. Checking 'silver.erp_loc_a101'
-- ====================================================================

-- >> Data Standardization & Consistency (Profiling)
-- Expectation: Clean country names ('United States', 'Germany', etc.)
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;


-- ====================================================================
-- 6. Checking 'silver.erp_px_cat_g1v2'
-- ====================================================================

-- >> Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    * FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- >> Data Standardization & Consistency (Profiling)
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
