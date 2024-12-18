select activity_date as 'day',
COUNT(distinct user_id) AS 'active_users' FROM activity WHERE 
activity_date Between DATE_SUB('2019-07-27', INTERVAL 29 DAY) and '2019-07-27' GROUP BY 1;
