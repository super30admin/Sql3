# Write your MySQL query statement below
select distinct(num) as consecutiveNums
from (
    select id,num,
    lag(num) over(order by id) as pervious_num,
    lead(num) over(order by id) as next_num
    from logs
) sq
where sq.num=sq.pervious_num and sq.num=sq.next_num;