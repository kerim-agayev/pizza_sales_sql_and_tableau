# pizza_sales_sql_and_tableau
 
# Pizza Sales Tableau Project


## Tableau Dashboard Link  
[Pizza Sales Dashboard on Tableau Public](https://public.tableau.com/app/profile/k.rim.a.ayev/viz/PIZZA_SALES/BESTWORSTSELLERS?publish=yes)



## Overview
This project involves analyzing pizza sales data to derive key insights and trends. Using SQL, we performed essential calculations and prepared the data for visualization in Tableau. The aim of the project is to explore pizza sales performance and create an interactive Tableau dashboard to showcase the findings.

## Steps Completed

### 1. Database Setup
We created and populated a database named `PIZZA_TABLEAU` to store our pizza sales data. This database serves as the foundation for our analysis.

```sql
CREATE DATABASE PIZZA_TABLEAU;
USE PIZZA_TABLEAU;
SELECT * FROM pizza_sales;
```

### 2. Analysis with SQL Queries
Several SQL queries were executed to extract key metrics and trends from the dataset.

#### a) Total Revenue
Calculate the total revenue generated from all pizza sales:
```sql
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
```

#### b) Average Order Value
Compute the average revenue per order:
```sql
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_sales;
```

#### c) Total Pizzas Sold
Determine the total number of pizzas sold:
```sql
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales;
```

#### d) Total Orders
Count the total number of distinct orders:
```sql
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;
```

#### e) Average Pizzas Per Order
Calculate the average number of pizzas per order:
```sql
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) /
            CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS average_pizzas_per_order
FROM pizza_sales;
```

#### f) Hourly Trend for Total Pizzas Sold
Analyze pizza sales trends by hour of the day:
```sql
SELECT DATEPART(HOUR, order_time) AS ORDER_HOUR, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY 1;
```

#### g) Weekly Trend for Total Pizzas Sold
Analyze pizza sales trends by week:
```sql
SELECT DATEPART(WEEK, order_date) AS week_number, YEAR(order_date) AS order_year,
       COUNT(DISTINCT order_id) AS total_pizzas_sold
FROM pizza_sales
GROUP BY DATEPART(WEEK, order_date), YEAR(order_date)
ORDER BY 1;
```

## Results
1. **Total Revenue**: The total revenue from all pizza sales was calculated.
2. **Average Order Value**: The average revenue generated per order provided insight into customer spending patterns.
3. **Total Pizzas Sold**: We determined the total quantity of pizzas sold over the analysis period.
4. **Total Orders**: The total number of unique orders was identified.
5. **Average Pizzas Per Order**: The average number of pizzas ordered per transaction was computed.
6. **Hourly Trend**: A breakdown of pizza sales by hour revealed peak ordering times.
7. **Weekly Trend**: Weekly sales trends highlighted seasonal or recurring patterns.

## Next Steps
The next phase involves loading this analyzed data into Tableau to create an interactive dashboard. The dashboard will feature:
- Total revenue and pizzas sold over time.
- Hourly and weekly sales trends.
- Visualizations of average order value and pizzas per order.

## Repository Structure
```
- /sql
  - queries.sql  # Contains all SQL queries used for analysis
- /data
  - pizza_sales.csv  # Raw data file
- /tableau
  - pizza_dashboard.twbx  # Tableau workbook
- README.md  # Project overview and SQL task descriptions
```

## Tools Used
- **SQL Server** for querying and analysis.
- **Tableau** for creating visual dashboards.
- **GitHub** for version control and project collaboration.

## Contact
For questions or feedback, please contact [Your Name] at [Your Email Address].

