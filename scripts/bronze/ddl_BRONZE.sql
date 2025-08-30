/*
===============================================
PURPOSE:
-----------------------------------------------
This script creates tables in the Bronze layer 
of the Data Warehouse. It includes tables for 
CRM data and ERP data, which are used to store 
customer, product, and sales information 
(CRM) as well as ERP-related data (customer, 
location, and product categories).

-----------------------------------------------
WARNINGS:
-----------------------------------------------
1. **Data Loss Warning:** Make sure these tables 
   are empty or do not contain critical data before 
   running this script.
   
2. **Table Structure:** Ensure the column types 
   align with the incoming data structure to avoid 
   data type mismatches during inserts.

3. **No Primary Key or Index:** These tables lack 
   primary keys or indexes. You may need to add 
   them later for better performance and data integrity.
===============================================
*/

use DataWareHouse;

-- Creating CRM tables
create table bronze.crm_cust_info(
    cst_id INT, 
    cst_key NVARCHAR(50), 
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50), 
    cst_marital_status NVARCHAR(10), 
    cst_gndr NVARCHAR(10), 
    cst_create_date DATE
);

create table bronze.crm_prd_info(
    prd_id INT, 
    prd_key NVARCHAR(50), 
    prd_nm NVARCHAR(50),
    prd_cost NVARCHAR(50), 
    prd_line NVARCHAR(10), 
    prd_start_dt DATE, 
    prd_end_dt DATE
);

create table bronze.crm_sales_details(
    sal_ord_num NVARCHAR(50), 
    sls_prd_key NVARCHAR(50), 
    sls_cust_id INT,
    slr_order_dt INT, 
    sls_ship_dt INT, 
    sls_due_dt INT, 
    sls_sales INT, 
    sls_quantity INT, 
    sls_price INT
);

-- Creating ERP tables
create table bronze.erp_CUST_AZ12(
    CID NVARCHAR(50), 
    BDATE DATE, 
    GEN NVARCHAR(10)
);

create table bronze.erp_LOC_A101(
    CID NVARCHAR(50), 
    CNTRY NVARCHAR(50)
);

create table bronze.erp_PX_CAT_G1V2(
    ID NVARCHAR(50), 
    CAT NVARCHAR(50), 
    SUBCAT NVARCHAR(50), 
    MAINTENANCE NVARCHAR(50)
);
