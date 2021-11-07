

-- 2 задание

select distinct firstname from users;


-- 3 задание

alter table profiles add is_active char (1) default 1;

select * from profiles p where birthday > '2003-11-07';

update profiles set is_active = 0 where birthday > '2003-11-07';


-- 4 задание

select * from messages m where created_at > '2021-11-07';

delete from messages where created_at > '2021-07-11';


-- 5 задание

"База данных банка"