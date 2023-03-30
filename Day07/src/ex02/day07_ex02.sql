-- Please write a SQL statement to see 3 favorite restaurants
-- by visits and by orders in one list (please add an action_type
-- column with values ‘order’ or ‘visit’, it depends on data from
-- the corresponding table). Please take a look at the sample of
-- data below. The result should be sorted by action_type column
-- in ascending mode and by count column in descending mode.

WITH cte(id, count, action_type) AS (
    (SELECT menu.pizzeria_id, COUNT(pizzeria_id) AS count, 'order'
     FROM menu
     JOIN person_order po ON menu.id = po.menu_id
     GROUP BY pizzeria_id
     ORDER BY count DESC
     LIMIT 3)
     UNION ALL
     (SELECT pizzeria_id, COUNT(pizzeria_id) AS count, 'visit'
      FROM person_visits pv
      GROUP BY pizzeria_id
      ORDER BY count DESC
      LIMIT 3)
    )

SELECT p.name AS name, count, action_type
FROM cte
JOIN pizzeria p ON cte.id = p.id
ORDER BY action_type ASC, count DESC;