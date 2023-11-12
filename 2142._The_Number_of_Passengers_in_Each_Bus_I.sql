with t as (SELECT passenger_id, min(b.arrival_time) AS arrival_time
FROM Passengers p
INNER JOIN Buses b
ON p.arrival_time <= b.arrival_time
GROUP BY passenger_id)

# Boarding time and bus id have 1 to 1 correspondence
# bus_id, COUNT(t.arrival_time) AS passengers_cnt
SELECT bus_id, count(t.arrival_time) AS passengers_cnt
FROM Buses b
left JOIN t
ON b.arrival_time = t.arrival_time
group by bus_id
ORDER BY bus_id