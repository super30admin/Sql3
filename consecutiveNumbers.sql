select distinct a.num as ConsecutiveNums from logs a, logs b, logs c
where (a.num = b.num and a.num = c.num) and 
(a.id = b.id - 1 and a.id = c.id - 2)