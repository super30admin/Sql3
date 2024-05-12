--SQL 3 solutions

-- 1) Consecutive Number - Problem No :- 8


select distinct l1.num as 'ConsecutiveNums'
from logs l1
inner join logs l2
on l1.id = l2.id-1
inner join logs l3
on l2.id = l3.id-1
where l1.num = l2.num
and l2.num = l3.num
;


-- 2) Number of Passengers in each bus - Problem No :- 9

with cte as (
select p.passenger_id, p.arrival_time, min(b.arrival_time) as btime
from passenger p inner join
buses b
on p.arrival_time <= b.arrival_time
)

select b.bus_id, count(c.btime) as 'passanger_cnt'
from buses b left join cte
on b.arrival_time = cte.btime
group by b.bus_id
order by b.bus_id;



-- 3) User Activity - Problem No :- 10

select activity_date as 'day', count(distinct user_id)  as 'active_users'
from Activity
where activity_date between DATE_SUB("2019-07-27", INTERVAL 29 DAY) and '2019-07-27'
group by activity_date
order by activity_date;

--4) Dynamic Pivoting of Table - Problem NO :- 11




CREATE PROCEDURE PivotProducts()
BEGIN
	SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
	SELECT GROUP_CONCAT( DISTINCT CONCAT('SUM(IF(store = "',store,'"price, null )) AS',store))
	INTO @sql FROM PRODUCTS;
	SET @sql = CONCAT('SELECT product_id,', @sql, ' FROM Products GROUP BY 1');
	PREPARE STATEMENT FROM @sql;
	EXECUTE STATEMENT;
	DEALLOCATE PREPARE STATEMENT;
END

