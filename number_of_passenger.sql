# Write your MySQL query statement below

with CTE as 
(
select
p.passenger_id,
min(b.arrival_time) as bus_arrival_time
from Buses b
inner join Passengers p 
on b.arrival_time >= p.arrival_time
group by 1
order by 1)

select
b1.bus_id,
count(CTE.passenger_id) as passengers_cnt
from buses b1 left join CTE on b1.arrival_time = CTE.bus_arrival_time
group by 1 order by 1