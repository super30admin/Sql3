-- User Activity	
--The two keys for solving this question are:
--select a specific date range
--count only distinct users as there are users having more than one activity per day, and the final results are grouped by day.

select activity_date as day ,count(distinct user_id) as active_users from activity 
where activity_date between '2019-06-28' and '2019-07-27' group by activity_date