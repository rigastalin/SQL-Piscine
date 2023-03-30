-- Let's refresh data in our Materialized View mv_dmitriy_visits_and_eats from exercise #06.
-- Before this action, please generate one more Dmitriy visit that satisfies the SQL clause
-- of Materialized View except pizzeria that we can see in a result from exercise #06.
-- After adding a new visit please refresh a state of data for mv_dmitriy_visits_and_eats.

-- CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS

WITH cte1(pizzeria_id, person_id, price, visit_date, pizzeria_name) AS (
    (SELECT pizzeria.id, person.id, price, visit_date, pizzeria.name
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE (price < 800) AND (person.name = 'Dmitriy') AND (visit_date = '2022-01-08'))),

    cte2(pizzeria_id) AS (
     (SELECT pizzeria.id
     FROM pizzeria
     JOIN menu ON pizzeria.id = pizzeria_id
     WHERE (price < 800) AND (pizzeria.id NOT IN(SELECT cte1.pizzeria_id FROM cte1)))
    )

INSERT INTO person_visits VALUES
    ((SELECT MAX(person_visits.id) FROM person_visits) + 1,
    (SELECT person_id FROM cte1),
    (SELECT MIN(pizzeria_id) FROM cte2),
    '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats






