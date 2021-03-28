create view superview AS
SELECT order_date, required_date, shipped_date,
       ship_postal_code, company_name, contact_name,
       phone, last_name, title from orders as o
                                        join customers as c on o.customer_id = c.customer_id
                                        join employees as e on o.employee_id = e.employee_id;

select * from superview
where order_date > '01.01.1997';

------------------------------------------------------------

create or replace view superview2 as
select order_date, required_date, shipped_date, ship_postal_code,
       ship_country, company_name, contact_name,
       phone, last_name, first_name, title, reports_to from orders as o
                                                                join customers as c on o.customer_id = c.customer_id
                                                                join employees as e on o.employee_id = e.employee_id;

select * from superview2
order by ship_country;

drop view superview2;

-----------------------------------------------------------

create or replace view superview3 as
select * from products
where discontinued <> 1
        with local CHECK OPTION;

insert into superview3
values(79, 'abc', 1,1,'abc', 1,1,1,1,0);

select * from superview3;
select * from products;

delete from superview3 where product_id = 79;