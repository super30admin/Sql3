# 1 Problem 1 : Consecutive Numbers (https://leetcode.com/problems/consecutive-numbers/)

# Solution
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id + 1 AND l2.id = l3.id + 1
    AND l1.num = l2.num AND l2.num = l3.num

# 2 Problem 2 :Number of Passengers in Each Bus ( https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/ )

# Solution
WITH CTE AS
(
    SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) AS btime
    FROM Buses b
    JOIN Passengers p
    ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)
SELECT b.bus_id, COUNT(c.btime) as passengers_cnt
FROM Buses b 
LEFT JOIN CTE c 
ON c.btime = b.arrival_time
GROUP BY b.bus_id
ORDER BY b.bus_id


# 3 Problem 3 :User Activity (https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )

# 1st Solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date

# 2nd Solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity 
WHERE activity_date >= '2019-06-28' AND activity_date <= '2019-07-27'
GROUP BY activity_date

# 3rd Solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) < 30 AND activity_date <= '2019-07-27'
GROUP BY activity_date

# 4th Solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN date_sub('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date

# 5th Solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN date_add('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27'
GROUP BY activity_date

# 4 Problem 4 :Dynamic Pivoting of a Table ( https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )
# Not done in Class yet.