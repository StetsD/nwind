-- для вкл безопасности на уровне строк нужна доп комманда
alter table products
    enable row level security;


create policy active_products_for_sales_stuff on products
    for select
    to sales_stuff
    using (discontinued <> 1);

