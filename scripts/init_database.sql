/***************************************************************************************************
*                                                                                                 *
*   SCRIPT: Create Database and Schemas for Data Warehouse                                        *
*                                                                                                 *
*   PURPOSE:                                                                                      *
*       - This script creates a new database called 'DataWareHouse'                               *
*       - If the database already exists, it will be **dropped** (deleted) and recreated           *
*       - Creates three schemas: bronze, silver, and gold to organize the data layers             *
*                                                                                                 *
*   WARNING:                                                                                      *
*       ⚠️ Running this script will DELETE the 'DataWareHouse' database if it exists,              *
*       along with ALL of its data, and then recreate it from scratch.                            *
*                                                                                                 *
***************************************************************************************************/


-- Switch to the master database (system database)
USE master;
GO

-- Check if the database 'DataWareHouse' already exists
-- If yes, drop it to ensure a fresh creation
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DataWareHouse')
BEGIN
    DROP DATABASE DataWareHouse;
END
GO

-- Create a new database named 'DataWareHouse'
CREATE DATABASE DataWareHouse;
GO

-- Switch context to the newly created DataWareHouse database
USE DataWareHouse;
GO

-- ==============================
-- Create Schemas
-- ==============================

-- Bronze Layer: Raw data, directly ingested from sources
CREATE SCHEMA bronze;
GO

-- Silver Layer: Cleaned, transformed, and standardized data
CREATE SCHEMA silver;
GO

-- Gold Layer: Curated and aggregated data for analytics & reporting
CREATE SCHEMA gold;
GO
