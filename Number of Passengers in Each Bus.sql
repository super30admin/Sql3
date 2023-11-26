# Write your MySQL query statement below
WITH CTE AS (
    SELECT p.passenger_id, min(b.arrival_time) AS arrival_time FROM Passengers p 
    INNER JOIN Buses b 
    ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)

SELECT b.bus_id, COUNT(CTE.arrival_time) AS passengers_CNT 
FROM Buses b 
LEFT JOIN CTE
ON b.arrival_time = CTE.arrival_time
GROUP BY b.bus_id
ORDER BY b.bus_id;