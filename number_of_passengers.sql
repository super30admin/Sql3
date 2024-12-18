with CTE AS(
    SELECT p.passenger_id , p.arrival_time, MIN(b.arrival_time)
    AS 'btime' From passengers p INNER JOIN Buses b ON p.arrival_time <=
    b.arrival_time GROUP BY p.passenger_id
)
SELECT b.bus_id, COUNT(c.btime) AS 'passengers_cnt' FROM busses btimeLEFT JOIN
CTE c on b.arrival_time = c.btime GROUP BY b.bus_id;
