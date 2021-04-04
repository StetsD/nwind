create or replace function get_square(ab real, bc real, ac real) returns real as $$
declare
    perimeter real;
begin
    perimeter = (ab + bc + ac) / 2;
    return sqrt(perimeter * (perimeter - ab) * (perimeter - bc) * (perimeter - ac));

end;
$$ language plpgsql;

select get_square(6,6,6);