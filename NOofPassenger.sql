with cte as 
(select p.passenger_id,
min(b.arrival_time) as b_arrival
from Passengers p join Buses b on p.arrival_time <= b.arrival_time
group by 1
)

select b.bus_id,
count(passenger_id) as passengers_cnt
from Buses b left join cte a on b.arrival_time = a.b_arrival
group by 1
order by 1 asc
