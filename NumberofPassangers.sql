-- Using inner join

with CTE as (
    select min(b.arrival_time) as arrival_time, p.passenger_id as pass_id
    from buses b inner join passengers p
    on p.arrival_time <= b.arrival_time
    group by p.passenger_id
)

select b.bus_id as bus_id, ifnull(count(CTE.arrival_time), 0) as passengers_cnt
from buses b left join CTE on b.arrival_time = CTE.arrival_time
group by bus_id
order by bus_id;


-- using left join

with CTE as (
    select min(b.arrival_time) as arrival_time, p.passenger_id as pass_id
    from passengers p left join buses b
    on p.arrival_time <= b.arrival_time
    group by p.passenger_id
)

select b.bus_id as bus_id, ifnull(count(CTE.arrival_time),0) as passengers_cnt
from buses b left join CTE on b.arrival_time = CTE.arrival_time
group by bus_id
order by bus_id;

