CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
    SET @sql = null;
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "',store,'", price,null))', store))INTO @sql 
    FROM Products;
    SET @sql=CONCAT('SELECT product_id, ', @sql, ' FROM Products GROUP BY 1');
    PREPARE STATEMENT FROM @sql;
    EXECUTE STATEMENT;
    DEALLOCATE PREPARE STATEMENT;
END