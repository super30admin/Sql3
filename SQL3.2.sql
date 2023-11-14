# Write your MySQL query statement below
                                                                                
SELECT bus_id, COUNT(e.arrival_time) AS passengers_cnt 
FROM Buses b2 LEFT JOIN (
				SELECT passenger_id, MIN(b1.arrival_time) AS arrival_time
				FROM Passengers p JOIN Buses b1
				ON p.arrival_time <= b1.arrival_time
				GROUP BY passenger_id) AS e 
ON e.arrival_time = b2.arrival_time 
GROUP BY b2.bus_id 
ORDER BY b2.bus_id;