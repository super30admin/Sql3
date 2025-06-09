CREATE PROCEDURE PivotProducts()
BEGIN

SET SESSION GROUP_CONCAT_MAX_LEN = 1000000;
    SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(IF(store = "',store , '" , price , null)) as ' , store))
    INTo @sql from products;
    
    SET @sql = CONCAT('SELECT product_id ,' , @sql , ' from products GROUP by 1');
    

    PREPARE statement from @sql;
    EXECUTE statement;
    DEALLOCATE PREPARE STATEMENT;

END