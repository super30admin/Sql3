WITH CTE AS (
    SELECT DISTINCT activity_date as day, user_id FROM Activity
WHERE activity_date BETWEEN DATE_ADD( '2019-07-27' , INTERVAL -29 DAY) AND '2019-07-27'  
)

SELECT CTE.day, COUNT(DISTINCT user_id) AS active_users
FROM CTE
GROUP BY CTE.day