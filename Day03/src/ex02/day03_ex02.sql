-- Please use SQL statement from Exercise #01 and show pizza names from pizzeria
-- which are not ordered by anyone, including corresponding prices also. The result
-- should be sorted by pizza name and price. The sample of output data is presented below.

WITH cte1(pizza_name, price, pizzeria_name) AS (
        SELECT menu.pizza_name, menu.price, pizzeria.name
        FROM menu, pizzeria
        WHERE menu.pizzeria_id = pizzeria.id
    ),

    cte2(pizza_name, price, pizzeria_name) AS (
        SELECT menu.pizza_name, menu.price, pizzeria.name
        FROM menu, person_order, pizzeria
        WHERE (menu.id = person_order.menu_id AND menu.pizzeria_id = pizzeria.id)
    )

SELECT *
FROM cte1
EXCEPT
SELECT *
FROM cte2
ORDER BY 1, 2;