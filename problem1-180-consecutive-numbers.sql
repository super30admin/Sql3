select
    distinct log1.num as ConsecutiveNums
from
    Logs log1,Logs log2,Logs log3
where log1.id = log2.id - 1
and log2.id = log3.id -1
and log1.num =log2.num
and log2.num =log3.num


-- join
SELECT DISTINCT log1.num as ConsecutiveNums
FROM Logs log1
JOIN Logs log2 ON log1.id = log2.id - 1
JOIN Logs log3 ON log2.id = log3.id - 1
WHERE log1.num = log2.num
  AND log2.num = log3.num


--window function
WITH ThreeConsecutive AS (
  SELECT
    CASE
      WHEN num = LAG(num, 1) OVER (ORDER BY id)
        AND num = LAG(num, 2) OVER (ORDER BY id)
      THEN num
    END AS ConsecutiveNums
  FROM Logs
)

SELECT
    DISTINCT ConsecutiveNums
FROM ThreeConsecutive
WHERE
    ConsecutiveNums IS NOT NULL;