SELECT b.id AS bus_id, COUNT(p.passenger_id) AS passengers_cnt
FROM Buses b
LEFT JOIN (
    SELECT p.passenger_id, MIN(b.id) AS bb
    FROM Passengers p
    JOIN Buses b ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
) AS p ON b.id = p.bb
GROUP BY b.id
ORDER BY b.id;