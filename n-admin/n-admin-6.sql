revoke all privileges on employees, orders, order_details, products from sales_stuff;
revoke all on database nwind from sales_stuff;
revoke all on schema public from sales_stuff;

drop policy active_products_for_sales_stuff on products;

drop role sales_stuff;

select * from pg_roles;
drop user john_smith;