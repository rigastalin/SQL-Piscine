SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria
WHERE NOT EXISTS(
    SELECT pizzeria_id FROM person_visits pv WHERE pv.pizzeria_id = pizzeria.id);