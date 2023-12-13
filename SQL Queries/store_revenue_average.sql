SELECT AVG(Total_Revenue) AS Average
FROM (SELECT store As Store, ROUND(SUM(weekly_sales::DECIMAL),2) As Total_Revenue
FROM walmartdata
GROUP BY Store)