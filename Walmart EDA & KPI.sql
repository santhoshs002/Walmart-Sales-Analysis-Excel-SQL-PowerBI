-- Exploratory Data Analysis (EDA)

-- checking everything in the data looks right
select * from ws_staging;

-- finding best and worst numbers
-- I)finding the largest weekly sales
select max(weekly_sales) from ws_staging;
-- II)finding the smallest weekly sales
select min(weekly_sales) from ws_staging;

-- top stores by sales
-- I) five biggest sales
select store, weekly_sales from ws_staging order by 2 desc limit 5;
-- II)top ten by adding each store's sales
select store, sum(weekly_sales) from ws_staging group by store order by 2 desc limit 10;

-- sales dataset's start date to end date
select min(`date`), max(`date`) from ws_staging;  -- 2010 to 2012

-- Groups sums - weekly sales for that category, sorted biggest first
select round(temperature,0), sum(weekly_sales) from ws_staging group by 1 order by 2 desc;
select round(fuel_price,1), sum(weekly_sales) from ws_staging group by 1 order by 2 desc;
select round(cpi,0), sum(weekly_sales) from ws_staging group by 1 order by 2 desc;
select round(Unemployment,1), sum(weekly_sales) from ws_staging group by 1 order by 2 desc;

-- trends over time
-- I) each date
select `date`, sum(weekly_sales) from ws_staging group by 1 order by 2;
select `date`, sum(weekly_sales) from ws_staging group by 1 order by 1; -- recent order
-- II) each year
select year(`date`), sum(weekly_sales) from ws_staging group by 1 order by 1 desc;
-- III) top 3 stores each year
with sale_cte as (select store, year(`date`) as yr, sum(weekly_sales) as tot from ws_staging group by 1,2),
scte as(select store, yr, tot, dense_rank() over(partition by yr order by tot desc) as rnk from sale_cte)
select store, yr, tot from scte where rnk <= 3 order by yr, tot desc;
-- IV) top 3 stores each week
with sale_cte as (select store, week(`date`) as wk, sum(weekly_sales) as tot from ws_staging group by 1,2),
scte as(select store, wk, tot, dense_rank() over(partition by wk order by tot desc) as rnk from sale_cte)
select store, wk, tot from scte where rnk <= 3 order by wk, tot desc;

-- Running total by month
with date_cte as(select substring(date,1,7) as months, sum(weekly_sales) as tot from ws_staging where
substring(date,1,7) is not null group by 1 order by 1 asc)
select months, tot, sum(tot) over(order by months asc) as running_total_sales from date_cte 
order by 1 asc;

-- stores where the weekly sales are greater than the average
select store, weekly_sales from ws_staging where Weekly_Sales > (select avg(weekly_sales) 
from ws_staging);










-- Key Performance Indicator(KPI)
-- Total Revenue
select sum(weekly_sales) as Total_Revenue from ws_staging;

-- Average Weekly Sales per Store
select store, avg(weekly_sales) as Avg_Weekly_Sales from ws_staging group by store order by Avg_Weekly_Sales desc;

-- Store with Highest Total Sales
select store, sum(weekly_sales) as Total_Sales from ws_staging group by store order by Total_Sales desc limit 1;

-- Average Sales on Holidays vs Non-Holidays
select holiday_flag,  count(*) as Num_Weeks, sum(weekly_sales) as Total_Sales, avg(weekly_sales) as Average_Sales from ws_staging group by holiday_flag;

-- Monthly Total Sales
select date_format(`date`, '%Y-%m') as Yr_Month, sum(weekly_sales) as Monthly_Sales from ws_staging group by 1 order by 1;

-- Overall Average Weekly Sales
select avg(weekly_sales) as Overall_Average_Weekly_Sales from ws_staging;