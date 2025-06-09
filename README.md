# Sql3

1 Problem 1 : Consecutive Numbers	(https://leetcode.com/problems/consecutive-numbers/)


Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 




------------------------------------------------------------------------------


SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l2.id = l1.id + 1
JOIN Logs l3 ON l3.id = l2.id + 1
WHERE l1.num = l2.num
  AND l2.num = l3.num;


------------------------------------------------------------------------------

2 Problem 2 :Number of Passengers in Each Bus 	(	https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )


Buses and passengers arrive at the LeetCode station. If a bus arrives at the station at time tbus and a passenger arrived at time tpassenger where tpassenger <= tbus and the passenger did not catch any bus, the passenger will use that bus.

Write a solution to report the number of users that used each bus.

Return the result table ordered by bus_id in ascending order.

The result format is in the following example.

 
------------------------------------------------------------------------------
WITH Cumulative AS (
  SELECT
    b.bus_id,
    b.arrival_time,
    COUNT(p.passenger_id) OVER (ORDER BY b.arrival_time) AS total_passengers_till_bus
  FROM Buses b
  LEFT JOIN Passengers p
    ON p.arrival_time <= b.arrival_time
)
SELECT
  bus_id,
  total_passengers_till_bus
    - LAG(total_passengers_till_bus, 1, 0) OVER (ORDER BY arrival_time) AS passengers_cnt
FROM Cumulative
ORDER BY bus_id;



------------------------------------------------------------------------------


3 Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )


------------------------------------------------------------------------------
Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

Return the result table in any order.

The result format is in the following example.
------------------------------------------------------------------------------
 
SELECT
  activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN SUBDATE('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'
GROUP BY activity_date;
 



------------------------------------------------------------------------------

4 Problem 4 :Dynamic Pivoting of a Table	(	https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )


Implement the procedure PivotProducts to reorganize the Products table so that each row has the id of one product and its price in each store. The price should be null if the product is not sold in a store. The columns of the table should contain each store and they should be sorted in lexicographical order.

The procedure should return the table after reorganizing it.

Return the result table in any order.

The result format is in the following example.

 
------------------------------------------------------------------------------

CREATE PROCEDURE PivotProducts()
BEGIN
  DECLARE col_list TEXT;

  -- Build a comma-separated list of dynamic pivot columns
  SELECT GROUP_CONCAT(
    DISTINCT CONCAT(
      'MAX(CASE WHEN store = ''', store, ''' THEN price END) AS `', store, '`'
    )
  ) INTO col_list
  FROM Products;

  -- Prepare the dynamic SQL query
  SET @sql = CONCAT(
    'SELECT id, product, ',
    col_list,
    ' FROM Products GROUP BY id, product ORDER BY id'
  );

  -- Execute the dynamic SQL
  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END

 


------------------------------------------------------------------------------
