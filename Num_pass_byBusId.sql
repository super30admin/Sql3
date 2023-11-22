-- Write your MySQL query statement below

-- cte requirement: passengers board earliest bus arrived

With CTE as (
SELECT passenger_id,min(b.arrival_time) as arrival_time
FROM Buses b
inner join Passengers p on p.arrival_time <= b.arrival_time
group by passenger_id
order by arrival_time)

select bus_id, count(c.arrival_time) as passengers_cnt 
from Buses b
left join cte c
on c.arrival_time = b.arrival_time
group by b.bus_id
order by b.bus_id