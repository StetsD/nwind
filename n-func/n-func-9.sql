create or replace function backup_customers() returns void as $$
drop table if exists customers_backup;
    create table customers_backup as
    select * from customers;
    $$ language sql;

select * from backup_customers();

select * from customers_backup;

------------------------------------------------------

create or replace function avg_freight() returns double precision as $$
select avg(freight) from orders;
$$ language sql;

select * from avg_freight();

------------------------------------------------------

create or replace function random_between(low int, high int) returns float as $$
begin
    return floor(random() * (high - low + 1) + low);
end;
$$ language plpgsql;

select * from random_between(1, 5);

------------------------------------------------------