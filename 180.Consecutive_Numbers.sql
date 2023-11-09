# Write your MySQL query statement below
select distinct(l1.num) as ConsecutiveNums
from Logs as l1
inner join Logs as l2
on l1.id+1 = l2.id
inner join Logs as l3
on l1.id+2 = l3.id
where l1.num = l2.num and l1.num = l3.num
