select * from  pizza_sale

--Total Revenue
select sum(total_price) as Total_Revenue 
from pizza_sale;

--Avg Order Value
select sum(Total_price)/count(distinct order_id) 
as Avg_order_value 
from pizza_sale;

--Total Pizzas Sold
select sum(qunatity) as Total_Pizza 
from pizza_sale;

--Total_Orders
select count(distinct order_id) as Total_order from pizza_sale
ans :21350
--Avg Pizzas Per Order
select cast(cast(sum(qunatity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) from pizza_sale;

--Daily Trend
select DATENAME(order_date) as order_day , count(distinct order_id) from pizza_sale
group by datename(DW, order_date) 

--Hourly Trend
select DATEPART(HOUR, order_date) as order_day , count(distinct order_id) from pizza_sale
group by datename(HOUR, order_date) 

--% OF sales BY Category
select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100/ (select sum(total_price) from pizza_sale) as pct
from pizza_sale
group by pizza_category;

--% Of sale by size
select pizza_size, sum(total_price) as total_sales, cast(sum(total_price) * 100/ (select sum(total_price)
from pizza_sale) as decimal(10,2)) as pct
from pizza_sale
group by pizza_size
order by  pct;

--Total pizzas sold by pizza category
select pizza_category, sum(qunatity) as Total_quantity_sold from pizza_sale
group by pizza_category;

--Top 5 best seller
select pizza_name, sum(qunatity) as Total_quantity_sold from pizza_sale
group by pizza_name
order by Total_quantity_sold desc
limit 5;

