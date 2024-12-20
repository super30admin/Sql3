with cte as (
select p.passenger_id, min(b.arrival_time) as atime from Passengers  p
left join buses b on p.arrival_time<= b.arrival_time
group by p.passenger_id)

select bus_id, ifnull(count(cte.passenger_id),0)as passengers_cnt from Buses b1
left join cte on b1.arrival_time = cte.atime
group by bus_id
order by bus_id