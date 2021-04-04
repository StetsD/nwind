grant connect on database nwind to sales_stuff;
grant connect on database nwind to northwind_admins;

grant usage on schema public to sales_stuff;
grant usage on schema public to northwind_admins;
grant create on database nwind to northwind_admins;

grant sales_stuff to john_smith;
grant northwind_admins to north_admin;