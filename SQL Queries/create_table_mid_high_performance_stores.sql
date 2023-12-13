SELECT store AS Store, Total_Revenue
INTO Mid_High_Performance_Stores
FROM (SELECT store As Store, ROUND(SUM(weekly_sales::DECIMAL),2) As Total_Revenue
FROM walmartdata
GROUP BY Store)
WHERE Total_Revenue BETWEEN 149715977.49 AND 207445542.27