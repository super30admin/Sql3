select activity_date as 'day' , COUNT(DISTINCT user_id) AS 'active_users' from Activity
WHERE activity_date >'2019-06-27' AND activity_date <='2019-07-27' Group by activity_date;
