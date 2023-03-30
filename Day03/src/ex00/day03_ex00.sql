-- Please write a SQL statement which returns a list of pizza names, pizza prices,
-- pizzerias names and dates of visit for Kate and for prices in range from 800 to 1000 rubles.
-- Please sort by pizza, price and pizzeria names. Take a look at the sample of data below.


SELECT m.pizza_name AS pizza_name, m.price AS price, pizzeria.name AS pizzeria_name, pv.visit_date AS visit_date
FROM menu m
JOIN pizzeria ON pizzeria.id = m.pizzeria_id
JOIN person_visits pv ON pv.pizzeria_id = m.pizzeria_id
JOIN person p ON (p.id = pv.person_id AND p.name = 'Kate')
WHERE m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name
