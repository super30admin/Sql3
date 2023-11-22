--Write your MySQL query statement below
--count(distinct user_id) as active_users
--DATEDIFF(activity_date,'2019-07-27') = 30

Select a1.activity_date as day, count(distinct a1.user_id) as active_users
FROM 
      Activity a1
where DATEDIFF('2019-07-27',a1.activity_date)  30
      and a1.activity_date = '2019-07-27'
group by a1.activity_date