WITH cte(person, pizza) AS (
    SELECT person_id, pizzeria_id AS counter
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    )

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER() AS id, person, pizza,
    (CASE
        WHEN COUNT(person) = 1 THEN 10.5
        WHEN COUNT(person) = 2 THEN 22
        ELSE 30
    END)
    AS count_per
FROM cte
GROUP BY cte.person, cte.pizza
ORDER BY cte.person, cte.pizza;