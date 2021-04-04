begin;
with prod_update as (
    update products set discontinued = 1
        where units_in_stock < 10
        returning product_id
)
select * into last_orders_on_discontinued
from order_details
where product_id in (select product_id from prod_update);
commit;

select * from last_orders_on_discontinued;

drop table if exists last_orders_on_discontinued;

-------------------------------------------------------------

begin;
with prod_update as (
    update products set discontinued = 1
        where units_in_stock < 10
        returning product_id
)
select * into last_orders_on_discontinued
from order_details
where product_id in (select product_id from prod_update);

drop table last_orders_on_discontinued1;
-- rollback;

commit;

select * from last_orders_on_discontinued;

---------------------------------------------------------------

begin;
with prod_update as (
    update products set discontinued = 1
        where units_in_stock < 10
        returning product_id
)
select * into last_orders_on_discontinued
from order_details
where product_id in (select product_id from prod_update);

delete from order_details
where product_id in (select product_id from last_orders_on_discontinued);

select * from order_details;

rollback;

commit;

----------------------------------------------------------------

begin transaction isolation level serializable;
with prod_update as (
    update products set discontinued = 1
        where units_in_stock < 10
        returning product_id
)
select * into last_orders_on_discontinued
from order_details
where product_id in (select product_id from prod_update);

savepoint backup;

delete from order_details
where product_id in (select product_id from last_orders_on_discontinued);

rollback to backup;

update order_details
set quantity = 0
where product_id in(select product_id from last_orders_on_discontinued);

commit;

select * from order_details
where product_id in(select product_id from last_orders_on_discontinued);

drop table if exists last_orders_on_discontinued;