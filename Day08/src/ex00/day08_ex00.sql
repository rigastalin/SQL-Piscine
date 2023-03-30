begin; -- session_1
begin; -- session_2

update pizzeria set rating = 5 where name = 'Pizza Hut'; -- session_1
select * from pizzeria; -- session_2

commit; -- session_1
select * from pizzeria; -- session_2