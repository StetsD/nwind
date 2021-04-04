create or replace function fib(n int) returns int as $$
declare
    counter int = 0;
    i int = 0;
    j int = 1;
begin
    if n < 1 then
        return 0;
    end if;

    while counter <= n
        loop
            counter  = counter + 1;
            select j, i+j into i, j;
        end loop;

    return i;
end;
$$ language plpgsql;

select fib(10);

-------------------------------------------------------------

create or replace function fib(n int) returns int as $$
declare
    counter int = 0;
    i int = 0;
    j int = 1;
begin
    if n < 1 then
        return 0;
    end if;

    loop
        exit when counter = n + 1;
        counter  = counter + 1;
        select j, i+j into i, j;
    end loop;

    return i;
end;
$$ language plpgsql;

select fib(10);

---------------------------------------------------------

do
$$
    begin
        for counter in 1..5
            loop
                raise notice 'counter - %', counter;
            end loop;
    end
$$

---------------------------------------------------------

