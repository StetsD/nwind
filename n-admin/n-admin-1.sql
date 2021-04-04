create role sales_stuff;
create role northwind_admins;

drop role if exists sales_stuff;
drop role if exists northwind_admins;

create user john_smith with password 'qwerty';
create user north_admin with password 'qwerty';

revoke create on schema public from public;
revoke all on database nwind from public;

