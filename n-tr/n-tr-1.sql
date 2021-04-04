drop table if exists products_audit;

create table product_audit
(
    op char(1) not null,
    user_changed text not null,
    time_stamp timestamp not null,
    product_id smallint not null,
    product_name varchar(40) not null,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit varchar(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer not null
);

create or replace function build_audit_products() returns trigger as $$
begin
    if tg_op = 'INSERT' then
        insert into product_audit
        select 'I', session_user, now(), nt.* from new_table nt;
    elseif tg_op = 'UPDATE' then
        insert into product_audit
        select 'U', session_user, now(), nt.* from new_table nt;
    elseif tg_op = 'DELETE' then
        insert into product_audit
        select 'D', session_user, now(), ot.* from old_table ot;
    end if;
    return null;
end;
$$ language plpgsql;

drop trigger if exists audit_products_insert on products;
create trigger audit_products_insert after insert on products
    referencing new table as new_table
    for each statement execute procedure build_audit_products();

drop trigger if exists audit_products_update on products;
create trigger audit_products_update after update on products
    referencing new table as new_table
    for each statement execute procedure build_audit_products();

drop trigger if exists audit_products_delete on products;
create trigger audit_products_delete after delete on products
    referencing old table as old_table
    for each statement execute procedure build_audit_products();

select * from products order by product_id desc;

insert into products values (82, 'Russian Mozarella', 7, 4, '200g', 50, 20, 0, 0, 0);

select * from product_audit;

update products
set unit_price = 80
where product_id = 82;

select * from product_audit;

delete from products where product_id = 82;