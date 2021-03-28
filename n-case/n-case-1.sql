select order_id, order_date, coalesce(ship_region, 'unknown')
from orders
limit 10;

---------------------------------------------------------

select last_name, first_name, coalesce(region, 'N/A')
from employees;

---------------------------------------------------------

select contact_name, coalesce(nullif(city, ''), 'unknown') as city
from customers;

--------------------------------------------------------