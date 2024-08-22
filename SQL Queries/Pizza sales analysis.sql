SELECT * FROM pizza_sales;

-- TOTAL REVENUE
-- THE SUM OF TOTAL PRICE OF ALL ORDERS
SELECT SUM(total_price) AS [Total Revenue]
FROM pizza_sales;

-- Average Order Value
-- dividing the total revenue by total number of orders
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS [Average Order Value]
FROM pizza_sales;

-- Total pizza sold
-- sum of pizza quanity of all pizzas sold
SELECT SUM(quantity) AS [Total Pizza Sold]
FROM pizza_sales;

-- total orders
-- the total number of orders placed
SELECT COUNT(DISTINCT order_id) AS [Total Orders]
FROM pizza_sales;

-- Average Pizzas per Order
-- divide total number of pizzas sold by total number of orders
SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))
/CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) AS [Average Pizzas per Order]
FROM pizza_sales;

-- Daily trend for total orders
SELECT DATENAME(DW,order_date) AS [Order Day], COUNT(DISTINCT order_id) AS [Total Order]
		FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

-- Monthly trend for total orders
SELECT DATENAME(M,order_date) AS [Order Month], COUNT(DISTINCT order_id) AS [Total Order]
FROM pizza_sales
GROUP BY DATENAME(M,order_date)
ORDER BY [Total Order] DESC;

-- Percentage of sales by pizza category
SELECT pizza_category ,	CAST(SUM(total_price) AS decimal(10,2)) AS [Total Revenue],CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS [% of Total Sales] 
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of sales by pizza size
SELECT pizza_size ,	CAST(SUM(total_price) AS decimal(10,2)) AS [Total Revenue],CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS [% of Total Sales] 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY 3 DESC;

-- Total pizzas sold by pizzas category
SELECT pizza_category , sum(quantity) AS [Total Pizzas]
FROM pizza_sales
GROUP BY pizza_category
ORDER BY 2 DESC;

-- Top 5 best seller pizzas by revenue
SELECT TOP 5 pizza_name , CAST(SUM(total_price) AS decimal(10,2)) AS [Total Revenue]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

-- Bottom 5 best seller pizzas by revenue
SELECT TOP 5 pizza_name , CAST(SUM(total_price) AS decimal(10,2)) AS [Total Revenue]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ASC;

-- Top 5 best seller pizzas by quantity
SELECT TOP 5 pizza_name , CAST(SUM(quantity) AS decimal(10,2)) AS [Total Quantity]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

-- Bottom 5 best seller pizzas by quantity
SELECT TOP 5 pizza_name , CAST(SUM(quantity) AS decimal(10,2)) AS [Total Quantity]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ASC;

-- Top 5 best seller pizzas by order
SELECT TOP 5 pizza_name , COUNT(DISTINCT order_id) AS [Total Order]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

-- Bottom 5 best seller pizzas by order
SELECT TOP 5 pizza_name , CAST(SUM(quantity) AS decimal(10,2)) AS [Total Order]
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ASC;