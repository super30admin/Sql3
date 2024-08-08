# Write your MySQL query statement below
SELECT activity_date AS day, count(distinct user_id) AS active_users
FROM Activity
WHERE activity_date > DATE_SUB(CAST('2019-07-27' as date), INTERVAL 30 DAY) AND activity_date <= '2019-07-27'
GROUP BY activity_date