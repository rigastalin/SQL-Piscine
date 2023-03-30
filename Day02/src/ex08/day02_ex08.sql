-- Please find the names of all males from Moscow or Samara cities who orders either pepperoni or
-- mushroom pizzas (or both) . Please order the result by person name in descending mode.
-- The sample of output is presented below.

WITH cte_1(cte_name, cte_id) AS (SELECT name, id FROM person WHERE gender = 'male' AND (address = 'Samara' OR address = 'Moscow')),
     cte_2(id) AS (SELECT * FROM menu WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')

SELECT cte_1.cte_name AS name
FROM cte_1
JOIN person_order po ON po.person_id = cte_1.cte_id
JOIN cte_2 ON po.menu_id = cte_2.id
ORDER BY name DESC;
