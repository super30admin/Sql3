##Consecutive Numbers

SELECT DISTINCT l1.num as ConsecutiveNums FROM logs l1, logs l2, logs l3
WHERE l1.id = l2.id - 1 AND l2.id = l3.id - 1 AND l1.num = l2.num AND l2.num = l3.num;


##Number of Passengers in Each Bus

WITH CTE AS (SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) as btime
			FROM passengers p INNER JOIN buses b on p.arrival_time <= b.arrival_time 
			GROUP BY p.passenger_id)
			
SELECT b.bus_id, COUNT(c.btime) AS 'passenger_cnt'
FROM buses b LEFT JOIN CTE C on b.arrival_time = c.btime
GROUP BY b.bus_id ORDER BY b.bus_id;


##User Activity for the Past 30 Days 

SELECT activity_date as 'day', COUNT(DISTINCT user_id) as 'active_users'
FROM activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY 1


##Dynamic Pivoting of a Table 

SET SESSION GROUP_CONCAT_MAX_LEN 100000;
SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store="'store'",price,null)) AS',store)) INTO @sql FROM Products;

SET @sql = CONCAT('SELECT product_id,',@sql,'FROM Products GROUP BY 1');

PREPARE STATEMENT FROM @sql;
EXECUTE STATEMENT;
DEALLOCATE PREPAE STATEMENT;
