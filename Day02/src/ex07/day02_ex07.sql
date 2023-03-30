-- Please find the name of pizzeria Dmitriy visited on January 8, 2022 and could eat pizza for less than 800 rubles.

WITH cte_1(cte_name) AS (SELECT * FROM person WHERE name = 'Dmitriy'),
cte_2(cte_date) AS (SELECT * FROM person_visits WHERE visit_date = '2022-01-08'),
cte_3(cte_price) AS (SELECT * FROM menu WHERE price < '800')

SELECT p.name AS pizzeria_name
FROM pizzeria p
JOIN cte_3 ON p.id = cte_3.pizzeria_id
JOIN cte_2 ON p.id = cte_2.pizzeria_id
JOIN cte_1 ON cte_2.person_id = cte_1.cte_name;

