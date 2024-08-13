select distinct num as ConsecutiveNums 
from (
select id,lag(num) over(order by id) as prev_num,
num,
lead(num) over(order by id) as next_num
 from Logs 
)l
where (prev_num=num) and (num=next_num)
