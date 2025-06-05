CREATE PROCEDURE PivotProducts()
BEGIN

    SET SESSION GROUP_CONCAT_MAX_LEN = 10000000;
    SET @cols = (
    SELECT 
        GROUP_CONCAT( DISTINCT   
        CONCAT('MAX(IF(store = ''',store,''', price, NULL)) AS ', store) 
        )
    FROM Products order by store);

    SET @query = CONCAT('SELECT product_id, ', @cols, ' FROM Products GROUP BY product_id ;');


    PREPARE stmt FROM @query;
    EXECUTE stmt;


END