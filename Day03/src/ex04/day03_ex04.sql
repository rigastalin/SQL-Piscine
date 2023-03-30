-- Please find a union of pizzerias that have orders either from women or  from men.
-- Other words, you should find a set of pizzerias names have been ordered by females only and make
-- "UNION" operation with set of pizzerias names have been ordered by males only. Please be aware
-- with word “only” for both genders. For any SQL operators with sets don’t save duplicates
-- (UNION, EXCEPT, INTERSECT).  Please sort a result by the pizzeria name. The data sample is provided
-- below.

WITH cte1(pizzeria_name) AS (
        SELECT pizzeria.name
        FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order po ON po.menu_id = menu.id
        JOIN person ON person.id = po.person_id
        WHERE person.gender = 'male'
    ),

    cte2(pizzeria_name) AS (
        SELECT pizzeria.name
        FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order po ON po.menu_id = menu.id
        JOIN person ON person.id = po.person_id
        WHERE person.gender = 'female'
    ),

    cte3(pizzeria_name) AS (
        SELECT cte1.pizzeria_name
        FROM cte1
        EXCEPT
        SELECT cte2.pizzeria_name
        FROM cte2
    ),

    cte4(pizzeria_name) AS (
        SELECT cte2.pizzeria_name
        FROM cte2
        EXCEPT
        SELECT cte1.pizzeria_name
        FROM cte1
    )

SELECT *
FROM cte3
UNION
SELECT *
FROM cte4
ORDER BY 1;