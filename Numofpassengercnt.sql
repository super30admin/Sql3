#Approach:1
With ctc as (
Select p.passenger_id,p.arrival_time,min(b.arrival_time) as btime from passengers p inner join buses b where p.arrival_time<=b.arrival_time group by p.passenger_id)
Select b.bus_id, count(c.btime) as ‘passenger_cnt’ from buses b left join cte c where b.arrival_time=c.btime group by b.bus_id order by b.bus_id;
