-- Find full information about all possible pizzeria names and prices to get mushroom or pepperoni pizzas.
-- Please sort the result by pizza name and pizzeria name then. The result of sample data is below (please use the
-- same column names in your SQL statement).

SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, menu.price AS price
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;
