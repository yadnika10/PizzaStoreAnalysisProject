
select * from [Project(Analyst)].[dbo].[pizza_sales]

--Total Revenue--
select Round(sum(total_price),0) as Total_revenue from [Project(Analyst)].[dbo].[pizza_sales]

--Avg Amount Per Value--
select sum(total_price)/count(distinct Order_id) AS Avg_Order_Value from [Project(Analyst)].[dbo].[pizza_sales]

--Total Pizzas Sold--
select sum(quantity) as Total_Pizzas_Sold from [Project(Analyst)].[dbo].[pizza_sales]

--Total Orders--
select count(distinct order_id) as Total_Orders_Placed from [Project(Analyst)].[dbo].[pizza_sales]

--Avg Pizzas sold per order---
select CAST(CAST(sum(quantity) AS DECIMAL(10,2))/CAST(count(distinct order_id) AS DECIMAL(10,2)) as Decimal(10,2))
from [Project(Analyst)].[dbo].[pizza_sales]

---------------------------------------------------------
----Chart Requirements-----

--Daily Trend for Total Orders--
select datename(dw,order_date) as Day , count(distinct order_id) as Total_Orders from [Project(Analyst)].[dbo].[pizza_sales]
group by datename(dw,order_date)
order by count(distinct order_id) desc

--Monthly Trend for Total Orders--
select datename(Month,order_date) as Month, count(distinct order_id) as Total_Orders from [Project(Analyst)].[dbo].[pizza_sales]
group by datename(Month,order_date)
Order by count(distinct order_id) desc

--% of Sales by Pizza Category--
select pizza_category,CAST(sum(total_Price) AS DECIMAL(10,2)) AS Total_Revenue, 
CAST((sum(total_Price)*100)/(select sum(total_price) from [Project(Analyst)].[dbo].[pizza_sales]) AS DECIMAL(10,2))
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_category

--% of Sales by Pizza Size--
select pizza_size,CAST(sum(total_Price) AS DECIMAL(10,2)) AS Total_Revenue, 
CAST((sum(total_Price)*100)/(select sum(total_price) from [Project(Analyst)].[dbo].[pizza_sales]) AS DECIMAL(10,2))
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_size
order by pizza_size

--Total Pizzas Sold by Pizza Category--
select pizza_category,sum(Quantity)
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_category

--Top 5 Pizzas by Revenue--
select Top 5 pizza_name, CAST(sum(total_Price) AS DECIMAL(10,2)) AS Total_Revenue
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue desc

--Bottom 5 Pizzas by Revenue--
select Top 5 pizza_name, CAST(sum(total_Price) AS DECIMAL(10,2)) AS Total_Revenue
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue ASC

--Top 5 Pizzas by Quantity--
select Top 5 pizza_name, sum(Quantity) as Total_Qty
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_name
order by Total_Qty desc

--Bottom 5 Pizzas by Quantity--
select Top 5 pizza_name, sum(Quantity) as Total_Qty
from [Project(Analyst)].[dbo].[pizza_sales]
group by pizza_name
order by Total_Qty ASC