--1 Problem 1 : Consecutive Numbers	(https://leetcode.com/problems/consecutive-numbers/)
select distinct l1.num as ConsecutiveNums
from Logs l1
join Logs l2 on l1.id = l2.id-1
join Logs l3 on l1.id = l3.id-2
where l1.num = l2.num and l1.num =l3.num

--2 Problem 2 :Number of Passengers in Each Bus (https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )
WITH cte AS (
    SELECT p.passenger_id,MIN(b.arrival_time) AS b_time
    FROM passengers p
    INNER JOIN buses b ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)
SELECT b.bus_id,COUNT(c.passenger_id) AS passengers_cnt
FROM buses b
LEFT JOIN cte c ON b.arrival_time = c.b_time
GROUP BY b.bus_id
ORDER BY b.bus_id;

--3 Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )
select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date >= '2019-06-27' and activity_date <= '2019-07-27'
group by activity_date

--4 Problem 4 :Dynamic Pivoting of a Table	(https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )

CREATE PROCEDURE PivotProducts()
BEGIN
	SELECT 
    product_id,
    MAX(CASE WHEN store = 'LC_Store' THEN price END) AS LC_Store,
    MAX(CASE WHEN store = 'Nozama' THEN price END) AS Nozama,
    MAX(CASE WHEN store = 'Shop' THEN price END) AS Shop,
    MAX(CASE WHEN store = 'Souq' THEN price END) AS Souq
FROM 
    Products
GROUP BY 
    product_id;


END