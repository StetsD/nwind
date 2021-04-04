select product_name, units_in_stock,
       rank() over (order by product_id)
from products;

select product_name, units_in_stock,
       rank() over (order by units_in_stock)
from products;

--------------------------------------------------------------

select product_name, unit_price,
       dense_rank() over (
           order by
               case
                   when unit_price > 80 then 1
                   when unit_price > 30 and unit_price < 80 then 2
                   else 3
                   end
           ) as ranking
from products
order by unit_price DESC;

-------------------------------------------------------------------

select product_name, unit_price,
       lag(unit_price) over(order by unit_price DESC) - unit_price as price_lag
from products
order by unit_price desc;