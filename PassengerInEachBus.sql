SELECT 
    b.bus_id,
    COUNT(p.passenger_id) AS passengers_count
FROM Buses b
LEFT JOIN Passengers p 
    ON p.arrival_time <= b.arrival_time
GROUP BY b.bus_id
ORDER BY b.bus_id;
