# Write your MySQL query statement below

#SAMPLE WORK IDEA
#CREATE PROCEDURE PivotProducts()
#BEGIN
#	SELECT
#  	product_id,
#  	SUM(IF(store = 'store1', price, NULL)) AS store1,
#  	SUM(IF(store = 'store2', price, NULL)) AS store2,
#  	SUM(IF(store = 'store3', price, NULL)) AS store3,
#  	SUM(IF(store = 'store4', price, NULL)) AS store4,
#  	SUM(IF(store = 'store5', price, NULL)) AS store5
#	FROM
#  	Products p
#	GROUP BY
#  	product_id;
#END

CREATE PROCEDURE PivotProducts()
BEGIN
	#Write your MySQL query statement below.
    SET group_concat_max_len = 1000000;
    SET @sql = NULL;
    SELECT
    GROUP_CONCAT(DISTINCT CONCAT(
      'SUM(IF(store = "', store, '", price, null)) AS ', store) ORDER BY store ASC)
    INTO @sql
    FROM Products;

    SET @sql = CONCAT('SELECT product_id, ', @sql, ' FROM Products GROUP BY product_id');
    

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END