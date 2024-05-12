--Dynamic Pivoting of a Table

CREATE PROCEDURE PivotProducts()
BEGIN
    -- Set the maximum length for GROUP_CONCAT
    SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
    
    -- Generate dynamic SQL for pivoting
    SELECT GROUP_CONCAT(
        DISTINCT CONCAT('SUM(IF(Store = "', store, '", Price, NULL)) AS ', store)
    ) INTO @SQL
    FROM Products;
    
    -- Construct the final SQL query
    SET @SQL = CONCAT(
        'SELECT product_id, ', @SQL, ' FROM Products GROUP BY product_id'
    );
    
    -- Prepare and execute the SQL statement
    PREPARE stmt FROM @SQL;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END
