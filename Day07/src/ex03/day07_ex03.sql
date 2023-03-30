-- Please write a SQL statement to see restaurants are grouping by visits
-- and by orders and joined with each other by using restraunt name.
-- You can use internal SQLs from Exercise 02 (restaurants by visits
-- and by orders) without limitations of amount of rows.
--
-- Additioanlly, please add the next rules.
--
-- calculate a sum of orders and visits for corresponding pizzeria
-- (be aware, not all pizzeria keys are presented in both tables).
-- sort results by total_count column in descending mode and by name
-- in ascending mode.

WITH cte(name) AS (
    (SELECT p.name
     FROM pizzeria p
     JOIN person_visits pv ON p.id = pv.pizzeria_id)
    UNION ALL
    (SELECT p2.name
     FROM pizzeria p2
     JOIN menu m ON p2.id = m.pizzeria_id
     JOIN person_order po ON m.id = po.menu_id)
    )

SELECT cte.name, COUNT(*) AS total_count
FROM cte
GROUP BY cte.name
ORDER BY total_count DESC, cte.name ASC;