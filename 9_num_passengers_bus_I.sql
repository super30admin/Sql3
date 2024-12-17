WITH CTE AS(
    SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) AS 'bus_time'
    FROM passengers p INNER JOIN buses b ON p.arrival_time
    GROUP BY p.passenger_id
)

SELECT b.bus_id, COUNT(c.bus_time) AS 'passenger_count' 
FROM buses b LEFT JOIN CTE c ON b.arrival_time = c.bus_time
GROUP BY b.bus_id
ORDER BY b.bus_id