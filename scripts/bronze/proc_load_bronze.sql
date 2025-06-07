/*
=============================================================
Procedure load Script : load bronze layer (source -> Bronze)
=============================================================
Script Purpose:
  This script is to load data to bronze layer from external CSV files
  it performs:
  - truncates table before loading data
  - BULK INSERT to load data from CSV to bronze layer

Usage Example:
EXEC broze.load_bronze;
=============================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	SET @batch_start_time = GETDATE();
	BEGIN TRY
		PRINT '============================================================'

		PRINT 'Loading Bronze layer'

		PRINT '============================================================'

		PRINT '------------------------------------------------------------'
		PRINT 'Loading CRM Tables'
		PRINT '------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.crm_cust_info'	
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>>> Inserting Data Into: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Project\Data Warehouse\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>>> Inserting Data Into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Project\Data Warehouse\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>>> Inserting Data Into: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Project\Data Warehouse\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------'

		PRINT '------------------------------------------------------------'
		PRINT 'Loading ERP Tables'
		PRINT '------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>>> Inserting Data Into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Project\Data Warehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>>> Inserting Data into: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Project\Data Warehouse\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------';
	
		SET @start_time = GETDATE();
		PRINT '>>> Truncating Table: bronze.erp_px_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	
		PRINT '>>> Inserting data into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Project\Data Warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second';
		PRINT '>> --------------------------------------------'
		SET @batch_end_time = GETDATE();
		PRINT '>> ============================================'
		PRINT '>> Load Duration Bronze Layer: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' second';
		PRINT '>> ============================================'
	END TRY
	BEGIN CATCH
		PRINT '==================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE()
		PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR)
		PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR)
		PRINT '==================================================='
	END CATCH
END
