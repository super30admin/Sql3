# Write your MySQL query statement below
with cte as(select p.passenger_id,p.arrival_time,min(b.arrival_time) as btime from passengers p
inner join Buses b 
where p.arrival_time <= b.arrival_time
group by p.passenger_id)

select b.bus_id, count(c.btime) As passengers_cnt from buses b left join CTE C on b.arrival_time = c.btime
group by b.bus_id order by b.bus_id