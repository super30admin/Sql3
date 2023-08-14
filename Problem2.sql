-- Number of Passengers in Each Bus 
-- can be solved using CTE and count()
WITH CTE AS (select p.passenger_id, min(b.arrival_time) as min_arrival from Buses B 
join Passengers P on b.arrival_time>=p.arrival_time 
group by passenger_id)

Select bus_id,count(min_arrival) as passengers_cnt from buses b 
left join CTE ON b.arrival_time =CTE.min_arrival 
group by bus_id order by bus_id