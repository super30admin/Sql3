# Write your MySQL query statement below
with cte as(
select 
p.passenger_id,p.arrival_time,min(b.arrival_time) as btime
from passengers p 
inner join buses b on p.arrival_time <= b.arrival_time
group by 1)

select b.bus_id,count(c.passenger_id) as passengers_cnt
from buses b 
left join cte c on b.arrival_time=c.btime
group by 1
order by 1