-- CREATE DATABASE PIZZA_TABLEAU

USE PIZZA_TABLEAU

SELECT * FROM pizza_sales

-- total_revenue

select sum(total_price) as total_revenue from pizza_sales

-- average order value
select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales


-- total pizzas sold
select sum(quantity) as total_pizzas_sold from pizza_sales

-- total orders 
select count(distinct order_id) as total_ordes from pizza_sales

-- average pizzas per order

select CAST(CAST(sum(quantity) AS DECIMAL(10, 2))/ 
CAST(count(distinct order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) as average_pizzas_per_order from pizza_sales


-- HOURLY TREND FOR TOTAL PIZZAS SOLD
SELECT DATEPART(HOUR, order_time) AS ORDER_HOUR, SUM(quantity) as total_pizzas_sold FROM PIZZA_SALES
GROUP BY DATEPART(HOUR, order_time)
order by 1

-- WEEKLY TREND FOR TOTAL PIZZAS SOLD
SELECT DATEPART(WEEK, order_date) AS week_number,YEAR(ORDER_DATE) AS ORDER_YEAR, 
COUNT(DISTINCT ORDER_ID) as total_pizzas_sold FROM PIZZA_SALES
GROUP BY DATEPART(WEEK, order_date), YEAR(ORDER_DATE)
order by 1




-- PERCANTGE OF SALES BY PIZZA CATEGORY
select pizza_category,CAST(sum(total_price) AS DECIMAL(10,2)) AS TOTAL_SALES,
CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as percentage_of_total_sales 
from pizza_sales 
WHERE MONTH(ORDER_DATE) = 1
group by pizza_category

--
select pizza_category,CAST(sum(total_price) AS DECIMAL(10,2)) AS TOTAL_SALES,
CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales WHERE MONTH(ORDER_DATE) = 1) AS DECIMAL(10,2)) as percentage_of_total_sales 
from pizza_sales 
WHERE MONTH(ORDER_DATE) = 1
group by pizza_category



-- PERCENTAGE OF SALES BY PIZZA SIZE
select pizza_size,CAST(sum(total_price) AS DECIMAL(10,2)) AS TOTAL_SALES,
CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as percentage_of_total_sales 
from pizza_sales 
where DATEPART(QUARTER, ORDER_DATE) = 1
group by pizza_size

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY


-- TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD

SELECT TOP 5 PIZZA_NAME, SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE DESC

-- BOTTOM 5 WORST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 PIZZA_NAME, SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE 


-- TOP 5 PIZZAS BY QUANTITY

SELECT TOP 5 PIZZA_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_QUANTITY DESC

-- BOTTOM 5  PIZZAS BY QUANTITY

SELECT TOP 5 PIZZA_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_QUANTITY




-- TOP 5 PIZZAS BY COUNT ORDER

SELECT TOP 5 PIZZA_NAME, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS DESC

-- BOTTOM 5  PIZZAS BY COUNT ORDER

SELECT TOP 5 PIZZA_NAME, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS


