drop function if exists get_seasones;

create or replace function get_seasones(month_number int) returns text as $$
declare
    season text;
begin
    if month_number not between 1 and 12 then
        raise exception 'invalid month, you passed (%)', month_number using hint = 'allow from 1 to 12', errcode = 123;
    end if;

    if month_number between 3 and 5 then
        season = 'spring';
    elseif month_number between 6 and 8 then
        season = 'summer';
    elseif month_number between 9 and 11 then
        season = 'autumn';
    else season = 'winter';
    end if;

    return season;
end;
$$ language plpgsql;

select get_seasones(17);

----------------------------------------------
