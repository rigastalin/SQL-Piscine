SELECT DISTINCT order_date AS action_date,
    (SELECT name FROM person WHERE person_order.person_id = person.id) AS person_name
FROM person_order
JOIN person_visits pv ON person_order.person_id = pv.person_id
ORDER BY action_date ASC, person_name DESC;