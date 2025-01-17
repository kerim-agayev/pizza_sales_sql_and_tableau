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