alter table customers add column last_updated timestamp;

create or replace function track_changes_on_customers() returns trigger as $$
begin
    new.last_updated = now();
    return new;
end;
$$ language plpgsql;

drop trigger if exists customer_timestamp on customers;

create trigger customer_timestamp before insert or update on customers
    for each row execute procedure track_changes_on_customers();

update customers set address = 'blah'
where customer_id = 'ALFKI';

select * from customers
where customer_id = 'ALFKI';

select * from customers;

insert into customers
values ('ABCDE', 'company', 'contact', 'title', 'address', 'city', null, 'code', 'country', '','', null);

--------------------------------------------------------------------------

alter table employees
    add column user_changed text;

create or replace function track_changes_on_employees() returns trigger as $$
begin
    new.user_changed = session_user;
    return new;
end;
$$ language plpgsql;

drop trigger if exists employees_session on employees;
create trigger employees_session before insert or update on employees
    for each row execute procedure track_changes_on_employees();

select * from employees;

update employees
set photo = 'lalal.png'
where employee_id = 1;