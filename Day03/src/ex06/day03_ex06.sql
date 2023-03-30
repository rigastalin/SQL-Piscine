-- Please find the same pizza names who have the same price, but from different pizzerias.
-- Make sure that the result is ordered by pizza name. The sample of data is presented below.
-- Please make sure your column names are corresponding column names below.

WITH cte1(id, pizza_name, pizzeria_name_1, price) AS (
        SELECT p.id, menu.pizza_name, p.name, menu.price
        FROM menu
        JOIN pizzeria p ON p.id = menu.pizzeria_id
    ),

    cte2(id, pizza_name, pizzeria_name_2, price) AS (
        SELECT p.id, menu.pizza_name, p.name, menu.price
        FROM menu
        JOIN pizzeria p ON p.id = menu.pizzeria_id
    )

SELECT cte1.pizza_name, cte1.pizzeria_name_1, cte2.pizzeria_name_2, cte1.price
FROM cte1
INNER JOIN cte2 ON cte1.price = cte2.price AND cte1.pizza_name = cte2.pizza_name
WHERE cte1.id > cte2.id;