-- Solution to Problem 1
SELECT DISTINCT l1.num AS 'ConsecutiveNums'
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id - 1 AND l2.id = l3.id - 1
AND l1.num = l2.num AND l2.num = l3.num

-- Solution to Problem 1 (Using window function)
WITH CTE_leads AS (
    SELECT id, LEAD(id, 1) OVER (ORDER BY id) AS id_lead1, LEAD(id, 2) OVER (ORDER BY id) AS id_lead2,  
        num, LEAD(num, 1) OVER (ORDER BY id) AS lead1, LEAD(num, 2) OVER (ORDER BY id) AS lead2
    FROM Logs
)
  
SELECT DISTINCT num AS 'ConsecutiveNums'
FROM CTE_leads
WHERE num = lead1 AND num = lead2
AND id = id_lead1 - 1 AND id = id_lead2 - 2

-- Solution to Problem 2
WITH CTE_times AS (
    SELECT p.passenger_id, p.arrival_time, MIN(b.arrival_time) as 'bus_time'
    FROM Passengers p
    LEFT JOIN Buses b
    ON p.arrival_time <= b.arrival_time
    GROUP BY p.passenger_id
)
SELECT b.bus_id, COUNT(c.bus_time) AS 'passengers_cnt'
FROM Buses b
LEFT JOIN CTE_times c ON b.arrival_time = c.bus_time
GROUP BY b.bus_id ORDER BY b.bus_id

-- Solution to Problem 3
SELECT activity_date as 'day', COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY activity_date

-- Solution to Problem 4
CREATE PROCEDURE PivotProducts()
BEGIN
    SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "', store, '", price, null)) AS ', store)) 
    INTO @sql FROM products;
    
    SET @sql = CONCAT('SELECT product_id, ', @sql, ' FROM Products GROUP BY 1');

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
