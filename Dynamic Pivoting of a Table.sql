CREATE PROCEDURE PivotProducts()
BEGIN
	# I was found this problem extremely challenging and was unable to find a video of this problem on the S30.

   	SET group_concat_max_len = 5000;
    SELECT GROUP_CONCAT(DISTINCT 'MAX(CASE WHEN store = \'',
               store,
               '\' THEN price ELSE NULL END) AS ',
               store
               ORDER BY store) INTO @sql
    FROM Products;
    SET @sql =  CONCAT('SELECT product_id, ',
                    @sql,
                    ' FROM Products GROUP BY product_id');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END