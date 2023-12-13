CREATE TABLE walmart_store_data AS (
SELECT wd.store, wd.date, wd.weekly_sales, wd.temperature, wd.fuel_price, wd.cpi, wd.unemployment, wd.holiday_week, sp.performance
FROM walmartdata AS wd
LEFT JOIN store_performance AS sp
ON wd.store = sp.store
)