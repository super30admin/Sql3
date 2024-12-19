#Approach 1:
select distinct l1.num as 'ConsecutiveNums' from logs l1,logs l2,logs l3 where l1.id=l2.id-1 and l2.id=l3.id-1 and l1.num=l2.num=l3.num;

#Approach 2:
select distinct num as 'ConsecutiveNums' from ( select num , lag(num) over (order by id )as prev_num, lead(num) over(order by id) as next_num from logs) as t where num=prev_num and num=next_num;