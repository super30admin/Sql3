CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
    SET GROUP_CONCAT_MAX_LEN = 1000000; -- this is the tricky part
    SET @sql = NULL ;
    SELECT 
        GROUP_CONCAT(
        DISTINCT CONCAT(
            'MAX(CASE WHEN store = "',store,'" then price else NULL END) as `',store,'`'
        ) ORDER BY store ASC
        )INTO @sql
    FROM Products;

    SET @query= CONCAT('SELECT product_id, ',@sql,' FROM products GROUP BY product_id');

    PREPARE stmt from @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


END