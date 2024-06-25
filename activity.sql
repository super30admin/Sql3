# Write your MySQL query statement below
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
-- GROUP BY activity_date ;

# Using BETWEEN date1 AND date2 (both inclusive)
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
-- GROUP BY 1;

# Using DATEDIFF(date1, date2)
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- WHERE  DATEDIFF('2019-07-27', activity_date) BETWEEN 0 AND 29
-- GROUP BY 1;

# Using DATE_SUB(date, INTERVAL expr unit) 
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
-- GROUP BY activity_date;

# Using DATE_ADD(date, INTERVAL expr unit) 
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- WHERE activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27'
-- GROUP BY activity_date;

# Using Having clause ---> GROUP BY clause always comes before Having Clause 
-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM Activity
-- GROUP BY activity_date
-- HAVING activity_date > '2019-06-27' AND activity_date <= '2019-07-27'

SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
FROM Activity
GROUP BY activity_date
HAVING activity_date BETWEEN '2019-06-27' AND '2019-07-27';
