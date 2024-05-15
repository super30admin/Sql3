-- 1 Problem 1 : Consecutive Numbers	(https://leetcode.com/problems/consecutive-numbers/)

select distinct l1.num as ConsecutiveNums
from logs l1,logs l2, logs l3
where l1.id = l2.id -1
and l2.id = l3.id-1
and l1.num = l2.num
and l2.num = l3.num

-- 2 Problem 2 :Number of Passengers in Each Bus 	(	https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )

with CTE as(
select p.passenger_id, p.arrival_time, min(b.arrival_time) as "btime"
from Passengers p
    inner join Buses b
on p.arrival_time <= b.arrival_time
group by p.passenger_id #,p.arrival_time
)
select b.bus_id, count(c.btime) "passengers_cnt"
from Buses b
left join CTE c
on b.arrival_time = c.btime
   group by b.bus_id
    order by b.bus_id;

-- 3 Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )
select distinct activity_date as day, count(distinct user_id) active_users
from Activity
where 
-- activity_date between date_add('2019-07-27', interval -29 day) and '2019-07-27'
-- activity_date between date_sub('2019-07-27', interval 29 day) and '2019-07-27'
DATEDIFF('2019-07-27',activity_date) BETWEEN 0 AND 29
--activity_date between '2019-06-28' and '2019-07-27'
group by activity_date
order by activity_date

-- 4 Problem 4 :Dynamic Pivoting of a Table	(	https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )

CREATE PROCEDURE PivotProducts()
BEGIN
SET SESSION GROUP_CONCAT_MAX_LEN = 1000000; 
select GROUP_CONCAT(DISTINCT CONCAT('sum(if(store = "',store,'", price, null)) as ',store)) INTO @sql from Products;
SET @sql = CONCAT('select product_id, ',@sql, ' from Products group by product_id');
select @sql;
PREPARE STATEMENT from @sql;
EXECUTE STATEMENT;
DEALLOCATE PREPARE STATEMENT; 
END
