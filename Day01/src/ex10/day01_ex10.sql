SELECT p.name AS person_name, pizza_name, pi.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
ORDER BY person_name ASC, pizza_name ASC, pizza_name ASC;
