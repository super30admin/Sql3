-- Problem 3 :User Activity		(https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ )

select distinct activity_date as 'day', count(distinct user_id) as active_users
from activity 
where activity_date >= '2019-06-28' and activity_date <= '2019-07-27' 
group by activity_date