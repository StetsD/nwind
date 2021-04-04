grant select, insert, update, delete on table
    public.orders,
    public.order_details,
    public.products
    to sales_stuff;
grant select on table public.employees to sales_stuff;

grant select, insert, update, delete, references, trigger on all tables in schema
    public
    to northwind_admins;

