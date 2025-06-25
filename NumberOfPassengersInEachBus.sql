'''
2 Problem 2 :Number of Passengers in Each Bus ( https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )

'''

WITH CTE AS (
    SELECT passenger_id, Passengers.arrival_time, MIN(Buses.arrival_time) AS btime
    FROM Passengers
    JOIN Buses ON Passengers.arrival_time <= Buses.arrival_time
    GROUP BY passenger_id
)
SELECT bus_id, COUNT(btime) AS Passengers_cnt
FROM Buses
LEFT JOIN CTE ON btime = Buses.arrival_time
GROUP BY bus_id
ORDER BY bus_id