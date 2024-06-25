CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "',store,'",price,null)) AS ',store))
    INTO @sql FROM Products;
    SET @sql = CONCAT('SELECT product_id, ',@sql, ' FROM Products GROUP BY 1');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END
