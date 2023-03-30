-- Please write a simple SQL query that returns a list of unique
-- person names who made orders in any pizzerias. The result should be
-- sorted by person name.

SELECT DISTINCT p.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.person_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
ORDER BY p.name;