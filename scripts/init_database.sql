/*
============================
Create database and Schemas
============================

Script Purpose:
This script creates a database called 'DataWarehouse' and create schemas on it. there is 3 schemas: 'bronze', 'silver' and 'gold'
*/


use master;

-- Create the 'DataWarehouse' database 
create database DataWarehouse;
use DataWarehouse;


-- Create Schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go
