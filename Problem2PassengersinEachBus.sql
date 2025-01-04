WITH BusTime AS (
    SELECT bus_id, arrival_time, LAG(arrival_time,1,0) OVER (ORDER BY arrival_time) AS previous_arrival_time 
FROM Buses
),
FinalArrivalTime AS (
SELECT b.bus_id, p.passenger_id
FROM BusTime b
LEFT JOIN Passengers p
ON p.arrival_time>b.previous_arrival_time AND p.arrival_time<=b.arrival_time
)


SELECT f.bus_id, COUNT(f.passenger_id) AS passengers_cnt
FROM FinalArrivalTime f
GROUP BY f.bus_id
ORDER BY f.bus_id
