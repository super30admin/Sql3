-- Sol.1: 

SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
FROM activity WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY 1;

-- Sol.2:

-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM activity WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
-- GROUP BY 1;

-- Sol.3:

-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM activity WHERE DATEDIFF('2019-07-27', activity_date) >= 0 
-- AND DATEDIFF('2019-07-27', activity_date) < 30
-- GROUP BY 1;

-- Sol.4: 

-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM activity WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) 
-- AND '2019-07-27'
-- GROUP BY 1;


-- Sol.5: 

-- SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
-- FROM activity WHERE activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) 
-- AND '2019-07-27'
-- GROUP BY 1;
