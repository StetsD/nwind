create or replace function get_product_price_by_name(prod_name varchar) returns real as $$
select unit_price from products
where product_name = prod_name;
$$ language sql;

select get_product_price_by_name('Chocolade') as price;

-------------------------------------------------------

create or replace function get_price_boundaries(out max_price real, out min_price real) as $$
select max(unit_price), min(unit_price)
from products;
$$ language sql;

select * from get_price_boundaries();

--------------------------------------------------------

create or replace function get_price_boundaries_by_dis(is_dis int default 1, out max_price real, out min_price real) as $$
select max(unit_price), min(unit_price)
from products
where discontinued = is_dis;
$$ language sql;

select * from get_price_boundaries_by_dis();

----------------------------------------------------------
