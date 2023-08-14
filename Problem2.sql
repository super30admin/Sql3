/*
1. Use a cte to first get the arrival time of each passenger as the first bus he can catch.
2. We can now join the result on buses table on arrival time and count the number of passengers by grouping on bus_id. 
3. We use left join as some buses may not have passengers from the list.

Solved on leetcode without any problem: Yes
*/

with
    cte
    as
    (
        select p.passenger_id, min(b.arrival_time)  'arrival_time'
        from Buses b join Passengers p
            on p.arrival_time <= b.arrival_time
        group by passenger_id
    )
select b.bus_id, count(cte.arrival_time)  passengers_cnt
from Buses b left join
    from cte
    on b.arrival_time = cte.arrival_time
group by b.bus_id
order by b.bus_id