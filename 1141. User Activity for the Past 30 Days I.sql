
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE activity_date > '2019-06-27' AND
activity_date <= '2019-07-27'
GROUP BY activity_date

-- Using between
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE activity_date BETWEEN '2019-06-28' and '2019-07-27'
GROUP BY 1

-- Using DATEDIFF
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE DATEDIFF('2019-07-27',activity_date) BETWEEN 0 AND 29
GROUP BY 1

-- Using DATE_SUB
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27',INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY 1

-- Using DATE_ADD
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM activity
WHERE activity_date BETWEEN DATE_ADD('2019-07-27',INTERVAL -29 DAY) AND '2019-07-27'
GROUP BY 1

-- Using DATE_ADD and HAVING
SELECT activity_date AS day, count(DISTINCT user_id) AS active_users 
FROM activity 
GROUP BY activity_date
HAVING activity_date BETWEEN DATE_ADD('2019-07-27',INTERVAL -29 DAY) AND '2019-07-27'