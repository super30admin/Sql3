select
activity_date as 'day',
count(distinct user_id) as 'active_users'
from Activity
-- where activity_date >= '2019-06-28' and activity_date <= '2019-07-27'
-- where activity_date between '2019-06-28' and '2019-07-27'
where DATEDIFF('2019-07-27',activity_date) between 0 and 29
group by 1