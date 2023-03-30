-- Please find all pizza names (and corresponding pizzeria names using menu table) that Denis or
-- Anna ordered. Sort a result by both columns. The sample of output is presented below.

WITH cte_1(cte_name, cte_id) AS (SELECT name, id FROM person WHERE name = 'Denis' OR name = 'Anna')

SELECT pizza_name, p.name AS pizzeria_name
FROM menu
JOIN pizzeria p ON menu.pizzeria_id = p.id
JOIN person_order po ON menu.id = po.menu_id
JOIN cte_1 ON person_id = cte_1.cte_id
ORDER BY pizza_name ASC, pizzeria_name ASC;