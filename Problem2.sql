# Write your MySQL query statement below
WITH CTE AS (
    SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) AS 'btime'
    FROM Passengers p
    INNER JOIN Buses b
    ON p.arrival_time <= b.arrival_time
    GROUP BY passenger_id
)
SELECT b.bus_id, COUNT(c.btime) AS 'passengers_cnt'
FROM Buses b
LEFT JOIN CTE c
ON c.btime = b.arrival_time
GROUP BY b.bus_id
ORDER BY b.bus_id;