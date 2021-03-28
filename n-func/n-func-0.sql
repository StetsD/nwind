select *
into tmp_customers
from customers;

select * from
    tmp_customers;

create or replace function fix_customer_region() returns void as $$
update tmp_customers
set region = 'unknown'
where region is null;
$$ language sql;

select fix_customer_region();