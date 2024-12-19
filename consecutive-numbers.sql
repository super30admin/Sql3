"""
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
  
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
  
"""

-- method 1 : using LEAD()

with cte as
    (
        select 
            num, 
            lead(num, 1) over() num1, 
            lead(num, 2) over() num2 
        from 
            logs
    )

select 
    distinct num as ConsecutiveNums 
from 
    cte 
where 
    num = num1 and num = num2


-- method 2: using DISTINCT and WHERE

select 
    distinct l1.num as ConsecutiveNums
from 
    logs l1, logs l2, logs l3
where 
    l1.id = l2.id - 1
    and 
    l2.id = l3.id - 1
    and 
    l1.num = l2.num 
    and 
    l1.num = l3.num
