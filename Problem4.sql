/*
1. Create a group concat for getting the store names as columns. Using distinct to avoid duplicates.
2. For getting the final statement of fetching the product id and each store price as columns, we use concat.
3. Group concat has a default limit of 1024 characters. We need to increase it to a large value for this problem (100000). Prepare execute and deallocate the statement.

Solved on leetcode without any problem: No. I was not able to solve it at first. I had to look at the solution and understand the dynamic writing of query.
*/

CREATE PROCEDURE PivotProducts()
BEGIN
    SET group_concat_max_len
    = 1000000;
set @statement = NULL;
select
    group_concat( 
  distinct concat (
    'sum(case when store = "',store, '"  then price end ) as ',store)
order by store asc
) 
   into @statement
   from Products;

set @statement = concat('select product_id, ', @statement, ' from Products group by product_id');

prepare stmt from @statement;
execute stmt;
deallocate prepare stmt;
END