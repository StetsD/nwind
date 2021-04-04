create function convert_tmp_to(temperature real, to_celsfuls bool default true) returns real as $$
declare
    result_tmp real;
begin
    if to_celsfuls then
        result_tmp = (5.0/9.0) * (temperature - 32);
    else
        result_tmp = (9 + temperature);
    end if;

    return result_tmp;
end;
$$ language plpgsql;

drop function convert_tmp_to(temperature real, to_celsfuls bool);

select convert_tmp_to(80, false)