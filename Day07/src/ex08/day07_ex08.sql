-- Please write a SQL statement that returns address,
-- pizzeria name and amount of persons’ orders. The result
-- should be sorted by address and then by restaurant name.

SELECT p.address AS address, pi.name AS name, COUNT(*) AS count_of_orders
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
GROUP BY address, pi.name
ORDER BY address ASC, pi.name ASC;
