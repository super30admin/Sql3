# Write your MySQL query statement below
# select activity_date as 'day', Count(Distinct user_id) As 'active_users'
# from Activity where activity_date > '2019-06-27' and activity_date <= '2019-07-27'
# group by 1;
# select activity_date as 'day', Count(Distinct user_id) As 'active_users'
# from Activity where DATEDIFF('2019-07-27', activity_date) >= 0 AND DATEDIFF('2019-07-#27',activity_date) < 30
# group by 1;
select activity_date as 'day', Count(Distinct user_id) As 'active_users'
from Activity where activity_date between DATE_SUB('2019-07-27', Interval 29 DAY) AND '2019-07-27'
group by 1;