CREATE PROCEDURE PivotProducts()
BEGIN
	set session group_concat_max_len = 1000000; # default is 1024

	set @sql = null;
	select group_concat(
		distinct concat(
			'sum(if(store = , store, , price, null)) as ', store
		)
	)
	into @sql
	from Products;

	set @sql = concat('select product_id, ', @sql, ' from Products group by 1');

	prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;

END
