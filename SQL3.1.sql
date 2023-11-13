# Write your MySQL query statement below

SELECT distinct s.num as ConsecutiveNums 
FROM logs s, logs t, logs u
WHERE 
    s.id = t.id + 1 AND t.id = u.id + 1 AND 
    s.num = t.num AND t.num = u.num

