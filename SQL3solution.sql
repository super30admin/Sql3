#180. Consecutive Numbers
# Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN Logs l3 ON l1.id = l3.id - 2 AND l1.num = l3.num

#1141. User Activity for the Past 30 Days I
SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE activity_date > '2019-06-27' AND activity_date <'2019-07-27'
GROUP BY activity_date;

SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE activity_date > '2019-06-27' AND activity_date <'2019-07-27'
GROUP BY 1;

SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE DATEDIFF ('2019-07-27', activity_date) >=0  AND DATEDIFF ('2019-06-28', activity_date) <=0
GROUP BY activity_date;


SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE DATEDIFF ('2019-07-28', activity_date)  BETWEEN 0 AND 29 
GROUP BY activity_date;

SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE  activity_date BETWEEN DATE_SUB('2019-07-27' , INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY 1;


SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE  activity_date BETWEEN DATE_ADD('2019-07-27' , INTERVAL -29 DAY) AND '2019-07-27'
GROUP BY 1;

SELECT activity_date AS 'day', Count(DISTINCT user_id) AS 'active_users'
FROM Activity
GROUP BY activity_date Having activity_date > '2019-06-27' AND activity_date <= '2019-07-27';

#2142. The Number of Passengers in Each Bus I
# Write your MySQL query statement below
WITH CTE AS (SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) AS btime
FROM Passengers p INNER JOIN Buses b ON p.arrival_time <=b.arrival_time
GROUP BY p.passenger_id)

SELECT b.bus_id, COUNT(c.btime) AS 'passengers_cnt' from Buses b 
LEFT JOIN CTE c ON b.arrival_time  = c.btime
GROUP BY b.bus_id
ORDER BY b.bus_id;


#185. Department Top Three Salaries
WITH CTE AS (
    SELECT 
        e.name AS EmployeeName,
        e.departmentId, 
        e.salary, 
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM 
        Employee e
)
SELECT 
    d.name AS Department, 
    c.EmployeeName AS Employee, 
    c.salary AS Salary 
FROM 
    CTE c
JOIN 
    Department d ON c.departmentId = d.id 
WHERE 
    c.rnk <= 3;
