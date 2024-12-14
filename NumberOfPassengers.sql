with cte as 
(select p.passenger_id, p.arrival_time, min(b.arrival_time) as b_time from passengers p 
inner join buses b on p.arrival_time <= b.arrival_time 
group by p.passenger_id) 
select b.bus_id , count(c.b_time) as 'passengers_cnt' from buses b 
left join cte c on b.arrival_time = c.b_time 
group by b.bus_id order by b.bus_id;