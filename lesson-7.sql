
-- 1 задание

select * from users u

select * from orders o 

select * from orders_products op 

select * from products p 

insert into orders (user_id)
	select id from users where name = 'Геннадий'

insert into orders (user_id)
	select id from users where name = 'Наталья'
	
insert into orders (user_id)
	select id from users where name = 'Сергей'	
	
insert into orders_products (order_id, product_id, total)
	select 1, id, 5 from products
		where id = 1

select * from users u 
	where id in (select user_id from orders)
	
	
select u.id, u.name from users u 
	join orders o  on u.id = o.user_id 
	
	
-- 2 задание
	
select * from products p 

select * from catalogs c 

select p.id, p.name, p.price, c.name, c.id 
	from products as p left join catalogs as c
		on p.catalog_id = c.id
		
		
-- 3 задание
	
create table flights (
	id serial primary key,
	`from` varchar(50),
	`to` varchar(50))
	
insert into flights (`from`, `to`) values
	('Moscow', 'Irkutsk'),
	('Irkutsk', 'Novgorod'),
	('Novgorod', 'Moscow'),
	('Novgorod', 'Moscow'),
	('Omsk', 'Kazan')
	
select * from flights
	
create table cities (
	id serial primary key,
	En_name varchar(50),
	Ru_name varchar(50))
	
insert into cities (En_name, Ru_name) values
	('Moscow', 'Москва'),
	('Irkutsk', 'Иркутск'),
	('Novgorod', 'Новгород'),
	('Kazan', 'Казань'),
	('Omsk', 'Омск')
	
select * from cities 

select id, 
	(select ru_name from cities where en_name = flights.from) as `from`,
	(select ru_name from cities where en_name = flights.to) as `to`
from flights


select f.id, c1.ru_name as `from`, c2.ru_name as `to` 
	from flights as f 
		left join cities as c1
			on f.from = c1.en_name
		left join cities as c2
			on f.to = c2.en_name