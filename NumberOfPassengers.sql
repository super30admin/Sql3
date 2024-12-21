-- Solution.1: 
WITH CTE AS (
    SELECT 
        p.passenger_id, 
        p.arrival_time, 
        MIN(b.arrival_time) AS btime 
    FROM 
        passengers p 
    INNER JOIN 
        buses b 
    ON 
        p.arrival_time <= b.arrival_time 
    GROUP BY 
        p.passenger_id
)
SELECT 
    b.bus_id, 
    COUNT(c.btime) AS passengers_cnt 
FROM 
    buses b 
LEFT JOIN 
    CTE c 
ON 
    b.arrival_time = c.btime 
GROUP BY 
    b.bus_id 
ORDER BY 
    b.bus_id;

-- Solution.2: 
-- SELECT 
--     b.bus_id, 
--     COUNT(p.passenger_id) AS passengers_cnt
-- FROM 
--     Buses b
-- LEFT JOIN 
--     Passengers p ON p.arrival_time <= b.arrival_time
-- AND NOT EXISTS (
--     SELECT 1
--     FROM Buses b2 
--     WHERE b2.arrival_time < b.arrival_time AND p.arrival_time <= b2.arrival_time
-- )
-- GROUP BY 
--     b.bus_id
-- ORDER BY 
--     b.bus_id;