SELECT bus_id, COUNT(passenger_id) AS passengers_cnt 
FROM (
    SELECT P.passenger_id, P.arrival_time, MIN(B.arrival_time) AS bus_arrival
    FROM Passengers P LEFT JOIN Buses B ON P.arrival_time <= B.arrival_time
    GROUP BY P.passenger_id
) AS CTE RIGHT JOIN Buses ON CTE.bus_arrival = Buses.arrival_time
GROUP BY bus_id
ORDER BY bus_id ASC;