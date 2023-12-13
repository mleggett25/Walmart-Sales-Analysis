SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Total_Revenue) AS Below_Avg_Median FROM
(SELECT store AS Store, Total_Revenue
FROM (SELECT store As Store, ROUND(SUM(weekly_sales::DECIMAL),2) As Total_Revenue
FROM walmartdata
GROUP BY Store)
WHERE Total_Revenue < 149715977.49)