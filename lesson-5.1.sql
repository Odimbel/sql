


-- 1 задание

drop table if exists users_new;
create table users_new  (
	id serial primary key,
	name varchar (255),
	birthday_at date,
	created_at datetime,
	updated_at datetime
);

insert into users_new (name, birthday_at, created_at, updated_at) values
	 ('Геннадий', '1990-10-05', null, null),
 	 ('Наталья', '1984-11-12', null, null),
  	('Александр', '1985-05-20', null, null),
  	('Сергей', '1988-02-14', null, null),
  	('Иван', '1998-01-12', null, null),
  	('Мария', '1992-08-29', null, null);
  
update users_new set created_at = now(), updated_at = now();


-- 2 задание

create table users_new  (
	id serial primary key,
	name varchar (255),
	birthday_at date,
	created_at varchar (50),
	updated_at varchar (50)
);


insert into users_new (name, birthday_at, created_at, updated_at) values
	 ('Геннадий', '1990-10-05', '02.05.2018 12:00', '02.05.2018 12:05'),
 	 ('Наталья', '1984-11-12', '02.05.2020 12:00', '02.05.2020 12:05'),
  	('Александр', '1985-05-20', '02.05.2014 12:00', '02.05.2014 12:05'),
  	('Сергей', '1988-02-14', '02.05.2014 12:00', '02.05.2014 12:05'),
  	('Иван', '1998-01-12', '02.05.2021 12:00', '02.05.2021 12:05'),
  	('Мария', '1992-08-29', '02.05.2021 12:00', '02.05.2021 12:05');
  
 
update users_new set 
		created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
		updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

alter table users_new change 
		created_at created_at datetime default current_timestamp;
	
alter table users_new change 
		updated_at updated_at datetime default current_timestamp on update current_timestamp;
	

-- 3 задание
	
create table storehouses_products (
  id serial primary key,
  storehouse_id int unsigned,
  product_id int unsigned,
  value int unsigned,
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update current_timestamp
);


insert into storehouses_products (storehouse_id, product_id, value) values
		(1, 455, 100),
		(1, 300, 0),
		(1, 4522, 350),
		(1, 150, 20),
		(1, 840, 0),
		(1, 500, 1);
		
select * from storehouses_products order by if(value > 0, 0, 1), value;

-- 4 задание

select name, birthday_at from users where date_format(birthday_at, '%M') in ('may', 'august');

-- 5 задание

select id, name, field (id,2,5,1,2) as pos from catalogs c where id in (5,1,2);

select * from catalogs c  where id in (5,1,2) order by field(id,5,1,2); 


-- 1 задание