# Solution 1
SELECT DISTINCT L1.Num as "ConsecutiveNums" FROM Logs L1 
JOIN Logs L2 ON L1.Id = L2.Id - 1 
JOIN Logs L3 ON L2.Id = L3.Id - 1 
WHERE L1.Num = L2.Num AND L2.Num = L3.Num;

# Solution 2
select distinct l1.num as 'ConsecutiveNums' from logs l1,logs l2,logs l3 
where l1.id = l2.id-1 
and l2.id = l3.id -1 
and l1.num = l2.num 
and l2.num = l3.num