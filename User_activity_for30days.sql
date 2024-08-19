WITH CTE as (
    SELECT activity_date as day,  if(
    (activity_date > "2019-06-27" and activity_date <= "2019-07-27"),
    COUNT(DISTINCT user_id),
    count(0)
    ) as active_users
From Activity 
group by activity_date
)

SELECT * from CTE 
where day > "2019-06-27" and day <= "2019-07-27"