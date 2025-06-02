WITH CTE AS (
    SELECT p.passenger_id, MIN(b.arrival_time) AS btime
    FROM passengers p
    JOIN buses b ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)

SELECT b.bus_id, COUNT(c.btime) AS 'passengers_cnt'
FROM buses b
LEFT JOIN CTE c ON b.arrival_time = c.btime
GROUP BY b.bus_id
ORDER BY b.bus_id;