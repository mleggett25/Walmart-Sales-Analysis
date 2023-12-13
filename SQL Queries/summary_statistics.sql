SELECT 'total', ROUND(SUM(weekly_sales::DECIMAL),2) As revenue
FROM walmartdata
UNION
SELECT 'average', ROUND(AVG(weekly_sales::DECIMAL),2)
FROM walmartdata
UNION
SELECT 'min', min(weekly_sales)
FROM walmartdata
UNION
SELECT 'max', max(weekly_sales)
FROM walmartdata