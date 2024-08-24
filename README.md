# Sql3

## 1 Problem 1 : Consecutive Numbers	(https://leetcode.com/problems/consecutive-numbers/)
<br>
### 180. Consecutive Numbers
<br>
There are multiple possible ways to solve this question, such as Using CTE with Lead or LAG, Join the same table three times. <br> I will try to solve the questions using all the possible ways <br>
Lets start with the easiest possible way
Solution using CTE and LEAD Statements

Solution using Self Join with same Table
SELECT nums AS ConsecutiveNums FROM Logs l1, Logs l2, Logs l3
WHERE l1.id=l2.id-1 AND l2.id=l3.id-1 AND l1.num=l2.num AND l2.num=l3.num

WITH CTE AS (SELECT id,
                        LEAD(id,1) Over(ORDER BY id) AS num1 id1,
                        LEAD(id,2) Over(ORDER BY id) AS num1 id2,
                        num, 
                        LEAD(num,1) Over(ORDER BY id) AS num1,
                        LEAD(num,2) Over(ORDER BY id) AS num2
            FROM Logs)
SELECT num as ConsecutiveNums 
FROM CTE WHERE id=id1 AND id1=id2 AND num=num1 =

## 2 Problem 2 :Number of Passengers in Each Bus 	(	https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )
<br>
## Get each passenger's boarding time
WITH t AS
(
    SELECT passenger_id, MIN(b.arrival_time) AS arrival_time
    FROM Passengers p
    INNER JOIN Buses b
    ON p.arrival_time <= b.arrival_time
    GROUP BY passenger_id
)

# Boarding time and bus id have 1 to 1 correspondence
SELECT bus_id, COUNT(t.arrival_time) AS passengers_cnt
FROM Buses b
LEFT JOIN t
ON b.arrival_time = t.arrival_time
GROUP BY bus_id
ORDER BY bus_id


## 3 Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-pa-30-days-i/ )
<br>
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
GROUP BY activity_date;

## 4 Problem 4 :Dynamic Pivoting of a Table	(	https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )
<br>
CREATE PROCEDURE PivotProducts()
BEGIN

### #Override GROUP_CONCAT length which has a default limit of 1024
SET SESSION group_concat_max_len = 1000000;

### #Store case statement for dynamically generated columns in a variable ie case_stmt
SET @case_stmt = NULL;
SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN store = "', store, '" THEN price END) AS ', store))
INTO @case_stmt
FROM products;
 
### #Insert above statement (@case_stmt) in the following main query to frame final query 
SET @sql_query = CONCAT('SELECT product_id, ', @case_stmt, ' FROM products GROUP BY product_id');

### #Execute final query
PREPARE final_sql_query FROM @sql_query;
EXECUTE final_sql_query;
DEALLOCATE PREPARE final_sql_query;

END
