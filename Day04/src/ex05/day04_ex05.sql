-- Please create a Database View v_price_with_discount that returns a person's orders
-- with person names, pizza names, real price and calculated column discount_price
-- (with applied 10% discount and satisfies formula price - price*0.1). The result please
-- sort by person name and pizza name and make a round for discount_price column to integer
-- type. Please take a look at a sample result below.

CREATE VIEW v_price_with_discount AS

WITH cte1 AS (SELECT person.name AS person_name, pizza_name, price, ROUND(price - (price * 0.1)) AS discount_price
              FROM person_order po
              JOIN menu ON po.menu_id = menu.id
              JOIN person ON person.id = po.person_id
            )

SELECT *
FROM cte1
ORDER BY cte1.person_name, cte1.pizza_name;