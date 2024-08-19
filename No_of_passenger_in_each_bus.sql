with CTE as (
  Select P.passenger_id, Min(B.arrival_time) as Bus_arrival from passengers P
  join Buses B
  Where P.arrival_time <= B.arrival_time
  group by P.passenger_id
)

Select B.bus_id, Count(C.Bus_arrival) as passengers_cnt from Buses B
left join CTE C
on C.bus_arrival = B.arrival_time
group by B.bus_id
order by B.bus_id