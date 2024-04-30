
WITH cte AS (
    SELECT p.passenger_id, p.arrival_time, min(b.arrival_time) AS min_time
    FROM passengers p 
    INNER JOIN buses b
    ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)

SELECT b.bus_id,count(c.min_time) AS passengers_cnt 
FROM buses b
LEFT JOIN cte c
ON b.arrival_time = c.min_time
GROUP BY b.bus_id
ORDER BY b.bus_id

