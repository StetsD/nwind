insert into customers(customer_id, contact_name, city, country, company_name)
values
('AAAAA', 'Alfred Mann', NULL, 'USA', 'fake_company'),
('BBBBB', 'Alfred Mann', NULL, 'Austria','fake_company');

select contact_name, city, country
from customers
order by contact_name,
         (
             case when city is null then country
                  else city
                 end
             );

-------------------------------------------------------

select product_name, unit_price,
       case when unit_price >= 100 then 'too expensive'
            when unit_price >= 50 and unit_price < 100 then 'average'
            when unit_price < 50 then 'low price'
           end as flag
from products;

-------------------------------------------------------

select distinct contact_name,
                case when order_id is null then 0
                     when order_id is not null then (
                         select count(*) from orders as ord
                         where c.customer_id = ord.customer_id
                     )
                    end as flag
from customers as c
         left join orders as o on c.customer_id = o.customer_id
order by flag;

-------------------------------------------------------

select concat(first_name, ' ', last_name) as fio, coalesce(nullif(title, 'Sales Representative'), 'Sales Stuff')
from employees
order by fio;
