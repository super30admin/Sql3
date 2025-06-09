WITH CTE AS(
    SELECT p.passenger_id, p.arrival_time, min(b.arrival_time) AS btime from passengers p INNER JOIN buses b ON p.arrival_time<= b.arrival_time
    group by p.passenger_id
)
SELECT b.bus_id, COUNT(c.btime) as 'passengers_cnt' from buses b LEFT JOIN CTE c 
ON c.btime = b.arrival_time
Group By b.bus_id 