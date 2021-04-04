create function ret_next() returns setof int as $$
begin
    return next 1;
    return next 2;
    return next 3;
end;
$$ language plpgsql;

select * from ret_next();