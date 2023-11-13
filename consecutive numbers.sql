-- Write your MySQL query statement below
SELECT DISTINCT(L1.num) as ConsecutiveNums
FROM Logs L1, Logs L2, Logs L3
WHERE L1.num = L2.num
AND
L2.num = L3.num AND
L1.ID = L2.ID - 1 AND
L2.ID = L3.ID -1 