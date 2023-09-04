with cte as (
select passenger_id ,min(b.arrival_time) as arrival_time from buses b
join passengers p
on 
p.arrival_time<=b.arrival_time
group by passenger_id 
)
select b.bus_id,count(cte.arrival_time) as passengers_cnt from buses b
left join cte
on 
b.arrival_time=cte.arrival_time
group by b.bus_id
order by b.bus_id