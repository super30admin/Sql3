select activity_date as day,
count(distinct user_id) as active_users
from Activity

group by 1
having activity_date>='2019-06-27' and activity_date<='2019-07-27'
