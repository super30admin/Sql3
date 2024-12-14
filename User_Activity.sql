#Solution1
select activity_date as 'day' , count(distinct user_id) as 'active_users' from activity 
group by activity_date 
having activity_date >= '2019-06-28' and activity_date <= '2019-07-27' 

#Solution2
#datediff(date1,date2)
select activity_date as 'day' , count(distinct user_id) as 'active_users' from activity 
where datediff('2019-07-27', activity_date)<30 and datediff('2019-07-27', activity_date)>=0 
group by activity_date

#Solution3
#date_sub
select activity_date as 'day' , count(distinct user_id) as 'active_users' from activity 
where activity_date between date_sub('2019-07-27', interval 29 day) and '2019-07-27' 
group by activity_date

#Solution4
#date_add
select activity_date as 'day' , count(distinct user_id) as 'active_users' from activity 
where activity_date 
between date_add('2019-07-27', interval -29 day) and '2019-07-27' 
group by activity_date