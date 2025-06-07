# Write your MySQL query statement below
select activity_date as day,count(distinct user_id) as active_users
from activity
where  datediff('2019-07-27',activity_date) between 0 and 29
group by 1
having count(distinct user_id) >0