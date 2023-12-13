SELECT * INTO Store_Performance
FROM
(SELECT * FROM high_performance_stores
UNION
SELECT * FROM mid_high_performance_stores
UNION
SELECT * FROM mid_low_performance_stores
UNION
SELECT * FROM low_performance_stores)
