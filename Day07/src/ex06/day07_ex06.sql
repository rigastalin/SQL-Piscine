-- Please write a SQL statement that returns the amount of orders,
-- average of price, maximum and minimum prices for sold pizza by
-- corresponding pizzeria restaurant. The result should be sorted by
-- pizzeria name. Round your average price to 2 floating numbers.

SELECT pi.name, COUNT(pi.name) AS count_of_orders, (ROUND(SUM(m.price) / COUNT(pi.name), 2)) AS average_price,
       MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY pi.name
ORDER BY pi.name ASC;
