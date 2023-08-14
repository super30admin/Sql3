/*
1. Find the active users by counting the distinct users who have logged in between 30 days before 2019-07-27 and 2019-07-27.
2. Group by day and count the active users.

Solved on leetcode without any problem: Yes
*/


select activity_date day, count(distinct user_id) active_users
from
    Activity
where 
activity_date > date_add("2019-07-27",INTERVAL -30 day)
    and activity_date < "2019-07-27"
group by day
order by day