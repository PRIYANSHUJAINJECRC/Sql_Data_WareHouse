/*
===============================================
PURPOSE:
-----------------------------------------------
This stored procedure 'bronze.load_bronze' is used
to load data into the Bronze layer of the data
warehouse. It performs the following tasks:
1. Truncates and loads CRM tables:
- crm_cust_info
- crm_prd_info
- crm_sales_details
2. Truncates and loads ERP tables:
- erp_CUST_AZ12
- erp_LOC_A101
- erp_PX_CAT_G1V2

The procedure includes error handling, logging,
and execution time tracking to ensure smooth
data pipeline execution.

-----------------------------------------------
WARNINGS:
-----------------------------------------------
1. **Data Loss Warning:** This procedure will
**truncate** the tables before inserting new
data. Any existing data in these tables will
be deleted before the new data is inserted.

2. **File Path Dependency:** Ensure the CSV file
paths used in the procedure are correct and
accessible on the system where the SQL Server
is running.

3. **Large File Size:** Bulk inserts may take a
significant amount of time, especially with large
datasets. Ensure sufficient system resources
(memory, CPU) to handle large file processing.

===============================================
*/

create or alter procedure bronze.load_bronze as
begin
declare @start_time datetime;
declare @end_time datetime;
declare @duration varchar(50);

-- Start Timer
set @start_time = getdate();

print '=================================';
print ' loading Bronze layer ';
print '=================================';

begin try
print '---------------------------------';
print ' loading crm tables ';
print '---------------------------------';

-- Truncate and Insert crm_cust_info
print 'Truncating table bronze.crm_cust_info...';
truncate table bronze.crm_cust_info;
print 'Bulk inserting into bronze.crm_cust_info...';
bulk insert bronze.crm_cust_info
from 'D:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (firstrow=2, fieldterminator=',');

-- Truncate and Insert crm_prd_info
print 'Truncating table bronze.crm_prd_info...';
truncate table bronze.crm_prd_info;
print 'Bulk inserting into bronze.crm_prd_info...';
bulk insert bronze.crm_prd_info
from 'D:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (firstrow=2, fieldterminator=',', tablock);

-- Truncate and Insert crm_sales_details
print 'Truncating table bronze.crm_sales_details...';
truncate table bronze.crm_sales_details;
print 'Bulk inserting into bronze.crm_sales_details...';
bulk insert bronze.crm_sales_details
from 'D:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (firstrow=2, fieldterminator=',');

print '---------------------------------';
print ' loading erp tables ';
print '---------------------------------';

-- Truncate and Insert erp_CUST_AZ12
print 'Truncating table bronze.erp_CUST_AZ12...';
truncate table bronze.erp_CUST_AZ12;
print 'Bulk inserting into bronze.erp_CUST_AZ12...';
bulk insert bronze.erp_CUST_AZ12
from 'D:\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
with (firstrow=2, fieldterminator=',');

-- Truncate and Insert erp_LOC_A101
print 'Truncating table bronze.erp_LOC_A101...';
truncate table bronze.erp_LOC_A101;
print 'Bulk inserting into bronze.erp_LOC_A101...';
bulk insert bronze.erp_LOC_A101
from 'D:\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with (firstrow=2, fieldterminator=',');

-- Truncate and Insert erp_PX_CAT_G1V2
print 'Truncating table bronze.erp_PX_CAT_G1V2...';
truncate table bronze.erp_PX_CAT_G1V2;
print 'Bulk inserting into bronze.erp_PX_CAT_G1V2...';
bulk insert bronze.erp_PX_CAT_G1V2
from 'D:\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with (firstrow=2, fieldterminator=',');

end try
begin catch
print 'Error occurred during loading data:';
print ERROR_MESSAGE();
end catch;

-- End Timer
set @end_time = getdate();
set @duration = DATEDIFF(SECOND, @start_time, @end_time);

-- Print the total duration
print '=================================';
print 'Total Execution Duration: ' + cast(@duration as varchar(50)) + ' seconds';
print '=================================';

end;
--To execute the stored procedure use the following Cammand
exec bronze.load_bronze;
