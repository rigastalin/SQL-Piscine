-- Please find a union of pizzerias that have been visited either women or men. Other words,
-- you should find a set of pizzerias names have been visited by females only and make "UNION"
-- operation with set of pizzerias names have been visited by males only. Please be aware with
-- word “only” for both genders. For any SQL operators with sets save duplicates
-- (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). Please sort a result by the pizzeria name.
-- The data sample is provided below.

WITH cte1(pizzeria_name) AS (
        SELECT pizzeria.name
        FROM pizzeria
        JOIN person_visits pv ON pv.pizzeria_id = pizzeria.id
        JOIN person ON person.id = pv.person_id
        WHERE person.gender = 'male'
    ),

    cte2(pizzeria_name) AS (
        SELECT pizzeria.name
        FROM pizzeria
        JOIN person_visits pv ON pv.pizzeria_id = pizzeria.id
        JOIN person ON person.id = pv.person_id
        WHERE person.gender = 'female'
    ),

    cte3(pizzeria_name) AS (
        SELECT cte1.pizzeria_name
        FROM cte1
        EXCEPT ALL
        SELECT cte2.pizzeria_name
        FROM cte2
    ),

    cte4(pizzeria_name) AS (
        SELECT cte2.pizzeria_name
        FROM cte2
        EXCEPT ALL
        SELECT cte1.pizzeria_name
        FROM cte1
    )

SELECT *
FROM cte3
UNION ALL
SELECT *
FROM cte4
ORDER BY 1;
