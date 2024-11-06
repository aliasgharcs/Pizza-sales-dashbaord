select * from pizza_sales
select sum(total_price) as Total_revenue from pizza_sales

select sum(total_price)/count(distinct order_id)  as Avg_Order_value from pizza_sales

select sum(quantity) as Total_pizza_sold from pizza_sales

select count(distinct order_id) as Total_order from pizza_sales

SELECT 
    CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL (10 , 2 )) AS Avg_pizza_per_order
FROM
    pizza_sales

SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

select monthname(STR_TO_DATE(order_date, '%Y-%m-%d')) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY monthname(STR_TO_DATE(order_date, '%Y-%m-%d'))
order by Month_name desc

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
Limit 5

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold
limit 5

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
limit 5



