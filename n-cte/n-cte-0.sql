select company_name from suppliers
where country in (
    select country from customers
);

with customer_countries as (
    select country from customers
)
select company_name from suppliers
where country in ( select * from customer_countries);

--------------------------------------------------

select company_name from suppliers where not exists(
        select product_id from products
                                   join order_details using(product_id)
                                   join orders using(order_id)
        where suppliers.supplier_id = products.supplier_id
          and order_date between '1998-02-01' and '1998-02-04'
    );

select company_name from products
                             join order_details od on products.product_id = od.product_id
                             join orders o on od.order_id = o.order_id
                             join suppliers s on products.supplier_id = s.supplier_id
where order_date  between '1998-02-01' and '1998-02-04';

with filtered as (
    select company_name, s.supplier_id from products
                                                join order_details od on products.product_id = od.product_id
                                                join orders o on od.order_id = o.order_id
                                                join suppliers s on products.supplier_id = s.supplier_id
    where order_date  between '1998-02-01' and '1998-02-04'
)
select company_name from suppliers
where supplier_id not in (select filtered.supplier_id from filtered);

-------------------------------------------------------------------

