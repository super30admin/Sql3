SELECT activity_date as 'day', Count(Distinct user_id) as 'active_users'
from activity
where activity_date>'2019-06-27'
And activity_date<='2019-07-27'
group by activity_date