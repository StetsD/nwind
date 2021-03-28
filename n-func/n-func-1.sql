create or replace function get_total_number_of_goods() returns bigint as $$
select sum(units_in_stock)
from products;
$$ language sql;

select get_total_number_of_goods() as total_goods;

create or replace function get_avg_price() returns float8 as $$
select avg(unit_price)
from products;
$$ language sql;

select get_avg_price();