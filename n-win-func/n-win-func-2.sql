
select * from products
where product_id = ANY (
    select product_id
    from (
             select product_id, unit_price,
                    row_number() over (order by unit_price desc) as nth
             from products
         ) sorted_prices
    where nth < 4
);
