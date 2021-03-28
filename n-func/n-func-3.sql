create or replace function get_average_prices_by_prod_categories() returns setof double precision as $$
select avg(unit_price)
from products
group by category_id;
$$ language sql;

select * from get_average_prices_by_prod_categories();

--------------------------------------------------------

create or replace function get_avg_prices_by_prod_cats(out sum_price real, out avg_price float8)
    returns setof record as $$
select sum(unit_price), avg(unit_price)
from products
group by category_id;
$$ language sql;

select sum_price from get_avg_prices_by_prod_cats();
select sum_price, avg_price from get_avg_prices_by_prod_cats();

------------------------------------------------------

create or replace function get_customers_by_country(customer_country varchar)
    returns table(char_code char, company_name varchar) as $$
select customer_id, company_name
from customers
where customer_country = country;
$$ language sql;

select * from get_customers_by_country('USA');
select char_code, company_name from get_customers_by_country('USA');

-----------------------------------------------------------------

create or replace function get_customers_by_country2(customer_country varchar)
    returns setof customers as $$
select *
from customers
where customer_country = country;
$$ language sql;

select * from get_customers_by_country2('USA');
select company_name from get_customers_by_country2('USA');