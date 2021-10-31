
drop database if exists vk_demo;
create database vk_demo;
use vk_demo;


drop table if exists users;
create table users (
	id bigint unsigned not null auto_increment primary key, 
    firstname varchar(50),
    lastname varchar (50) comment 'Фамилия', -- 123
    email varchar(120) UNIQUE,
 	password_hash varchar (100), -- 123456 => vzx;clvgkajrpo9udfxvsldkrn24l5456345t
	phone bigint unsigned unique,
	
	index idx_users_firstname_lastname (firstname, lastname)
);


drop table if exists profiles;
create table profiles (
	user_id bigint unsigned not null unique,
	gender char (1),
	birthday date,
	photo_id bigint unsigned not null,
	created_at datetime default now(),
	hometown varchar(100)
);

alter table profiles add constraint fk_users_id
foreign key (user_id) references users (id)
on update cascade
on delete restrict;


drop table if exists messages;
create table messages ( 
	id serial,
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	body text,
	created_at datetime default now(),
	
	foreign key (from_user_id) references users (id),
	foreign key (to_user_id) references users (id)
);


drop table if exists friend_requests;
create table friend_requests (
	-- id serial,
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	`status` enum ('requested', 'approved', 'declined', 'unfriended'),
	requests_at datetime default now(),
	updated_at datetime on update current_timestamp,
	
	primary key (from_user_id, to_user_id),
	foreign key (from_user_id) references users (id),
	foreign key (to_user_id) references users (id)
	-- check (from_user_id <>to_user_id)
);

alter table friend_requests
add check (from_user_id <>to_user_id);


drop table if exists communities;
create table communities ( 
	id serial,
	name varchar(100),
	admin_user_id bigint unsigned not null,
	
	index communities_name_id (name),
	foreign key (admin_user_id) references users (id)
);


drop table if exists user_communities;
create table users_communities (
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
	
	primary key (user_id, community_id),
	foreign key (user_id) references users (id),
	foreign key (community_id) references communities (id)
);


drop table if exists media_types;
create table media_types ( 
	id serial,
	name varchar (255),
	created_at datetime default now(),
	updated_at datetime on update current_timestamp
);


drop table if exists media;
create table media ( 
	id serial,
	media_type_id bigint unsigned not null,
	user_id bigint unsigned not null,
	body text,
	filename varchar (255),
	size int,
	metadata json,
	created_at datetime default now(),
	updated_at datetime on update current_timestamp,
	
	foreign key (user_id) references users (id),
	foreign key (media_type_id) references media_types (id)
);


drop table if exists likes;
create table likes ( 
	id serial, 
	user_id bigint unsigned not null,
	media_id bigint unsigned not null,
	created_at datetime default now()
);


drop table if exists photo_albums;
create table photo_albums ( 
	id serial,
	name varchar (50),
	user_id bigint unsigned not null,
	primary key (id),
	foreign key (user_id) references users (id)
);


drop table if exists photos;
create table photos ( 
	id serial,
	album_id bigint unsigned not null,
	media_id bigint unsigned not null,
	
	foreign key (album_id) references photo_albums (id),
	foreign key (media_id) references media (id)
);


alter table likes add constraint likes_fk 
foreign key (media_id) references media(id);

alter table likes add constraint likes_fk_1 
foreign key (user_id) references users(id);

alter table profiles add constraint profiles_fk_1 
foreign key (photo_id) references media (id);


-- /* Домашнее задание*/ --
drop table if exists country;
create table country ( 
	id serial,
	country_name bigint unsigned not null,
	continents bigint unsigned not null,
	
	index idx_country_name (country_name),
	foreign key (country_name) references users (id)
);


drop table if exists city;
create table city ( 
	id serial,
	city_name bigint unsigned not null,
	people bigint unsigned not null,
	
	index idx_city_name_people (city_name, people),
	foreign key (city_name) references users (id),
	foreign key (city_name) references country (id)
);


drop table if exists music;
create table music ( 
	id serial,
	music_type_id bigint unsigned not null,
	user_id bigint unsigned not null,
	filename varchar (255),
	size int,
	created_at datetime default now(),
	updated_at datetime on update current_timestamp,
	
	foreign key (user_id) references users (id),
	foreign key (music_type_id) references media_types (id)
);

