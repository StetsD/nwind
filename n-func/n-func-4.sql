create or replace function get_total_number_of_goods() returns bigint as $$
begin
    return sum(units_in_stock)
        from products;
end;
$$ language plpgsql;

select get_total_number_of_goods();

--------------------------------------------------------------------------

create or replace function get_max_price_from_dis() returns real as $$
begin
    return max(unit_price)
        from products
        where discontinued = 1;
end;
$$ language plpgsql;

select get_max_price_from_dis();

--------------------------------------------------------------------------

create or replace function get_price_boundaries(out max_price real, out min_price real) as $$
begin
    max_price := max(unit_price) from products;
    min_price := min(unit_price) from products;
end;
$$ language plpgsql;

select get_price_boundaries();

create or replace function get_price_boundaries(out max_price real, out min_price real) as $$
begin
    select max(unit_price), min(unit_price)
    into max_price, min_price
    from products;
end;
$$ language plpgsql;

select get_price_boundaries();

--------------------------------------------------------------------------

create or replace function get_sum(x int, y int, out result int) as $$
begin
    result := x + y;
    return;
end;
$$ language plpgsql;

select * from get_sum(2, 2);