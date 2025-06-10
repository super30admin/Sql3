# Sql3

1 Problem 1 : Consecutive Numbers	(https://leetcode.com/problems/consecutive-numbers/)

Solution:
Select Distinct l3.num As ConsecutiveNums  from logs l1, logs l2, logs l3
where l1.id = l2.id - 1
AND l2. id = l3.id - 1
AND l1.num = l2.num AND l2.num = l3.num


2 Problem 2 :Number of Passengers in Each Bus 	(	https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )

Solution:
with cte as (SELECT 
    p.passenger_id, 
    p.arrival_time, 
    MIN(b.arrival_time) AS bTime
FROM Passengers p
JOIN Buses b 
    ON p.arrival_time <= b.arrival_time 
GROUP BY p.passenger_id
)

Select b.bus_id, count(c.btime) As 'passengers_cnt'
FROM buses b 
Left join cte c
on b.arrival_time = c.btime 
Group by b.bus_id
order by b.bus_id
3 Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )

Solution:
Select activity_date AS "day", 
Count(DISTINCT user_id) AS "active_users"
FROM Activity
WHERE DATEDIFF ('2019-07-27' , activity_date) >=0
AND DATEDIFF ('2019-07-27' , activity_date) <= 29
GROUP BY activity_date 

4 Problem 4 :Dynamic Pivoting of a Table	(	https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )

Solution:
CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below

    Set session group_concat_max_len = 1000000;
    select group_concat(distinct concat('Sum(if(store ="',store,'",  price, null )) as ', store))
    into @sql 
    from Products;

    SET @sql = CONCAT('Select product_id,', @sql, ' from Products group by product_id');

    prepare statement from @sql;
    execute statement;
    deallocate prepare statement;
END