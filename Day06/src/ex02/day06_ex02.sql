SELECT p.name AS name, m.pizza_name, m.price, price * ((100 - discount)/100) AS discount_price, pizzeria.name AS pizzeria_name
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN person p ON p.id = po.person_id
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
JOIN person_discounts pd ON p.id = pd.person_id AND pd.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name;