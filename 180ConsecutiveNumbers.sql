# Write your MySQL query statement below

SELECT DISTINCT num AS ConsecutiveNums FROM
(
    SELECT id, num, lead(id,1) over (order by id) as next_id, 
            lead(id,2) over (order by id) as next_next_id, 
            lead(num,1) over(order by id) as next, 
            lead(num,2) over (order by id) as next_next
    FROM Logs
) AS T
WHERE T.num = T.next and T.next = T.next_next
and T.next_id - T.id = 1 and T.next_next_id - T.next_id = 1