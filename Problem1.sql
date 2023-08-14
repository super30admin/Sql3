/*
1. Use 3 aliases of the table. id-1 gives the previous id. Check if both the nums are same for these two ids. 
2. Similarly check for row id-2 (One id before 2nd) since we need 3 consecutive numbers.
3. Return unique such nums that appeared 3 times consecutively.

Solved on leetcode without any problem: Yes
*/

select distinct l1.num as 'ConsecutiveNums'
from Logs l1, Logs l2, Logs l3
where
 l1.id = l2.id -1 and l2.id = l3.id - 1
    and l1.num = l2.num and l2.num = l3.num 

