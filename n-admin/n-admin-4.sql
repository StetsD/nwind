-- Прежде чем явно дать привилегии, необходимо их сначала явно изъять

revoke select on employees from sales_stuff;


grant select (employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date,
              city, region, postal_code, country, home_phone, photo, notes, reports_to, photo_path)
    on employees
    to sales_stuff;

