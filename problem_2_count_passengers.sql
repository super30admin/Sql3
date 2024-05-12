with cte as (
    SELECT p.passenger_id, p.arrival_time, min(b.arrival_time) as boarding_time
    FROM passengers p 
    JOIN buses b
    on p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id, p.arrival_time

)

SELECT b.bus_id, count(boarding_time) as passengers_cnt
FROM buses b
LEFT JOIN cte
on b.arrival_time = cte.boarding_time
GROUP BY bus_id
ORDER BY bus_id