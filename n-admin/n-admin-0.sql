create role role_name login;
-- equals
create user role_name;

-------------------------------------------

create user user_name with password 'boris';

-------------------------------------------

-- Если на пользователя назначены две роли и одна запрещает
-- создание БД а другая разрешает, то разрешение в приоритете

-- При создании БД, создаётся схема public
-- и скрытая роль public с доступом на запись в схему public

-- Всем новым ролям\пользователям неявно даются привелегии public

-- REVOKE CREATE ON SCHEMA public FROM public
-- REVOKE ALL ON DATABASE db_name FROM public

-- Остерегайся рольи CREATEROLE. Если user имеет привилению CREATEROLE, но не CREATEDB,
-- то щт может создать новую роль с правами CREATEDB. CREATEROLE - почти SUPERUSER!

-- ЧТобы изъять роль необходимо
-- + изъять все выданные ранее права
-- + переназначить все объекты на другую роль, которыми владела удаляемая роль

