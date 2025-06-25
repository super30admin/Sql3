'''
4 Problem 4 :Dynamic Pivoting of a Table ( https://leetcode.com/problems/dynamic-pivoting-of-a-table/ )
'''

CREATE PROCEDURE PivotProducts()
BEGIN
	# Write your MySQL query statement below.
SET GROUP_CONCAT_MAX_LEN = 1000000;    
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "', store, '", price, null)) as ' , store))
    INTO @sql FROM products;

    SET @sql = CONCAT('SELECT product_id,', @sql, ' FROM Products GROUP BY 1');

    PREPARE statement FROM @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE STATEMENT;

END