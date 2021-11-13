


-- 1 задание

select avg (timestampdiff (year, birthday_at, now())) from users;


-- 2 задание

select name, birthday_at from users;

select concat_ws('-', year(now()), month(birthday_at), day(birthday_at)) as day from users;

select date( concat_WS ('-', year(now()),month(birthday_at), day(birthday_at))) as day from users;

select date_format( date( concat_ws( '-', year (now()),month(birthday_at), day(birthday_at))), '%W') as day from users;
 
select date_format( date( concat_ws( '-', year (now()),month(birthday_at), day(birthday_at))), '%W') as dai, 
		count(*) as total from users group by dai order by total desc;


-- 3 задание
	
select id from catalogs c;

select ln (1*2*3*4*5), ln(1) + ln(2) + ln(3) + ln(4) + ln(5);

select exp(ln (1*2*3*4*5)), exp(ln(1) + ln(2) + ln(3) + ln(4) + ln(5));

select ln(id) from catalogs;

select sum(ln(id)) from catalogs;

select exp(sum(ln(id))) from catalogs;
