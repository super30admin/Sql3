# Approach 1:
select activity_date as 'day', count(distinct user_id)as 'active_users' from Activity where datediff(2019-07-27,activity_date)>0 and datediff(2019-07-27,activity_date)<=29 group by activity_date;

# Approach 2:
select activity_date as day, count(distinct user_id)as active_users from Activity where activity_date >=2019-06-28 and activity_date<=2019-07-27 group by activity_date;
