with CTE_table (
    SELECT p.passenger_id,p.arrival_time, min(b.arrival_time) 
    FROM passenger p
    JOIN bus b 
    ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)


SELECT b.bus_id, COUNT(c.btime) AS 'passenger_cnt' 
FROM bus b
LEFT JOIN CTE_table c on  b.arrival_time = c.btime 
GROUP BY b.bus_id
ORDER  BY b.bus_id