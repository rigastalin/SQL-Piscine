-- Please write a SQL statement which returns a list of pizzerias names with corresponding rating value which have not been visited by persons.
-- Denied
-- NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT

SELECT name, rating
FROM pizzeria
LEFT JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
WHERE visit_date IS NULL;
