

-- 1 задание

select count(*), from_user_id from messages m 
	where to_user_id = 1
group by from_user_id 
	order by 1 desc

			
-- 2 задание
			
select count(*), media_id 
	from likes
		where user_id in 
			(select user_id from profiles 
				where timestampdiff(year, birthday, now()) < 10)
group by media_id


-- 3 задание

select sum(media_id) from likes
	where user_id in (select user_id from profiles where gender = 'm')
		-- 80 лайков 

select sum(media_id) from likes
	where user_id in (select user_id from profiles where gender = 'f')
		-- 143 лайка 