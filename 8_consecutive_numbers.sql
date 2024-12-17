SELECT DISTINCT s1.num AS ConsecutiveNums
FROM SEAT s1, SEAT s2, SEAT s3
WHERE s1.id = s2.id - 1
AND s2.id = s3.id - 1
AND s1.num = s2.num
AND s2.num = s3.num