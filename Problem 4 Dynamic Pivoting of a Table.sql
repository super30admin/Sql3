CREATE PROCEDURE PivotProducts()
BEGIN

    SET SESSION GROUP_CONCAT_MAX_LEN =  1000000;
    # Step 1: Generate dynamic SQL for pivot columns
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "', store, '", price, NULL)) AS `', store, '`')) INTO @sql
    FROM products;

    # Step 2: Construct the complete dynamic SQL query
    SET @sql = CONCAT(
        'SELECT product_id, ', 
        @sql, 
        ' FROM products GROUP BY product_id'
    );
    # Step 3: Prepare and execute the dynamic SQL
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END