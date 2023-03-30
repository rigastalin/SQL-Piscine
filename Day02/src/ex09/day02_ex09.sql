-- Please find the names of all females who ordered both pepperoni and cheese pizzas (at any time and in any pizzerias).
-- Make sure that the result is ordered by person name. The sample of data is presented below.
WITH cte1(cte1_name) AS (SELECT name FROM person
        JOIN person_order po ON po.person_id = person.id
        JOIN menu m ON po.menu_id = m.id
        WHERE gender = 'female' AND pizza_name = 'pepperoni pizza'),

    cte2(cte2_name) AS (SELECT name FROM person
        JOIN person_order po ON po.person_id = person.id
        JOIN menu m ON po.menu_id = m.id
        WHERE gender = 'female' AND pizza_name = 'cheese pizza')

SELECT cte1.cte1_name AS name
FROM cte1
JOIN cte2 ON cte2.cte2_name = cte1.cte1_name
ORDER BY name ASC;