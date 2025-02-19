SELECT SUM(total_price) AS Total_Revenue FROM [my space].[dbo].[pizza_sales_excel_csv];

--i used count distinct because there is some dublicate in order_id 

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM [my space].[dbo].[pizza_sales_excel_csv]

SELECT SUM(quantity) AS Total_pizza_sold FROM [my space].[dbo].[pizza_sales_excel_csv]

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM [my space].[dbo].[pizza_sales_excel_csv]

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM [my space].[dbo].[pizza_sales_excel_csv]

SELECT DATEPART(HOUR, order_time) as order_hours, SUM(quantity) as total_pizzas_sold
from[my space].[dbo].[pizza_sales_excel_csv]
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

SELECT 
    DATEPART(ISO_WEEK, order_date) AS WeekNumber,
    YEAR(order_date) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY 
    DATEPART(ISO_WEEK, order_date),
    YEAR(order_date)
ORDER BY 
    Year, WeekNumber;
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [my space].[dbo].[pizza_sales_excel_csv]) AS DECIMAL(10,2)) AS PCT
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [my space].[dbo].[pizza_sales_excel_csv]) AS DECIMAL(10,2)) AS PCT
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [my space].[dbo].[pizza_sales_excel_csv]
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [my space].[dbo].[pizza_sales_excel_csv]
GROUP BY pizza_name
ORDER BY Total_Orders ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM[my space].[dbo].[pizza_sales_excel_csv]
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC




