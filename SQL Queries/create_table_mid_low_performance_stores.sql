SELECT store AS Store, Total_Revenue
INTO Mid_Low_Performance_Stores
FROM (SELECT store As Store, ROUND(SUM(weekly_sales::DECIMAL),2) As Total_Revenue
FROM walmartdata
GROUP BY Store)
WHERE Total_Revenue BETWEEN 85365979.53 AND 149715977.49