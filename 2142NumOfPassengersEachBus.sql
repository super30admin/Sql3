# Write your MySQL query statement below
with cte as
(
    select passenger_id,
    (select b.bus_id from Buses b where p.arrival_time <= b.arrival_time order by b.arrival_time limit 1) as bus_id
    from Passengers p
)
select b.bus_id, count(c.passenger_id) as 'passengers_cnt'
from Buses b LEFT JOIN cte c ON b.bus_id = c.bus_id
group by b.bus_id
order by b.bus_id
