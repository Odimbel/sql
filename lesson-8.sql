

-- 1 задание
-- Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем.

select u1.id, concat(u1.firstname, ' ', u1.lastname) as from_user,
		u2.id, concat(u2.firstname, ' ', u2.lastname) as to_user,count(*) to_user1
from users u1
join messages m
	on u1.id = m.from_user_id
join users u2
	on u2.id = m.to_user_id
		where u2.id = 1
group by u1.id 
	order by to_user1 desc limit 1

	
-- 2 задание
--  общее количество лайков, которые получили пользователи младше 10 лет.

select * from profiles p 

select * from likes l 

select * from media m 


select count(*) as total
from likes l 
	join media m on m.id = l.media_id 
	join profiles p on p.user_id = m.user_id 
where YEAR(CURDATE()) - YEAR(birthday) < 10


-- 3 задание
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select gender, count(*) total
from likes l 
		join profiles p on l.user_id = p.user_id 
group by p.gender 
		
		
		
	