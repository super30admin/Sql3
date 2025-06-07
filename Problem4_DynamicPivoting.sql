CREATE PROCEDURE PivotProducts()
BEGIN
-- 	select product_id,
--     sum(if(store='LC_Store',price,null)) as 'LC_Store',
--     sum(if(store='Nozama',price,null)) as 'Nozama',
--     sum(if(store='Shop',price,null)) as 'Shop',
--     sum(if(store='Souq',price,null)) as 'Souq'
--     from products
--     group by 1;
set session group_concat_Max_len=1000000;
    select
    group_concat(distinct(concat('sum(if(store="',store,'",price,null)) as ',store)))
    into @sql from products;

    set @sql=concat('select product_id,',@sql,' from products group by 1');
    
    prepare statement from @sql;
    execute statement;
    deallocate prepare statement;
END
