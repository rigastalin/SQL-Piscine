-- Please write a SQL statement which returns a list of pizzerias which Andrey visited
-- but did not make any orders. Please order by the pizzeria name. The sample of data is provided below.

WITH cte1(pizzeria_name) AS (
        SELECT DISTINCT pizzeria.name
        FROM pizzeria
        JOIN person_visits pv ON pv.pizzeria_id = pizzeria.id
        JOIN person ON person.id = pv.person_id
        WHERE person.name = 'Andrey'
    ),

    cte2(pizzeria_name) AS (
        SELECT DISTINCT pizzeria.name
        FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order po ON po.menu_id = menu.id
        JOIN person ON person.id = po.person_id
        WHERE person.name = 'Andrey'
    )

SELECT *
FROM cte1
EXCEPT
SELECT *
FROM cte2;
