create database walmart_sales;
use walmart_sales;
CREATE TABLE walmart_sales (Store int, `Date` date, Weekly_Sales decimal(10,2), Holiday_Flag int, 
Temperature decimal(5,2), Fuel_Price decimal(5,3), CPI decimal(8,3), Unemployment DECIMAL(5,2));
select * from walmart_sales;

create table ws_staging like walmart_sales;
insert into ws_staging select * from walmart_sales;

-- Removing Duplicates
select *, row_number() over(partition by store, `date`, weekly_sales, holiday_flag, temperature,
fuel_price, cpi, unemployment) as rownum from ws_staging;
with row_dup as(select *, row_number() over(partition by store, `date`, weekly_sales, holiday_flag, temperature,
fuel_price, cpi, unemployment) as rownum from ws_staging) select * from row_dup where rownum > 1;
-- no duplicates found

-- Checking for nulls and missing values
select count(*) as null_store from ws_staging where store is null or store = '';
select count(*) as null_store from ws_staging where `date` is null;
select count(*) as null_store from ws_staging where weekly_sales is null or weekly_sales = '';
select count(*) as null_store from ws_staging where holiday_flag is null or holiday_flag = '';
select count(*) as null_store from ws_staging where temperature is null or temperature = '';
select count(*) as null_store from ws_staging where fuel_price is null or fuel_price = '';
select count(*) as null_store from ws_staging where cpi is null or cpi = '';
select count(*) as null_store from ws_staging where unemployment is null or unemployment = '';

-- Checking for negative weekly sales
SELECT * FROM ws_staging WHERE weekly_sales < 0;

-- Check for Holiday Flag Anomalies(Valid values - column should only be 0 or 1)
select distinct holiday_flag from ws_staging;