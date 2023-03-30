-- Please write 2 SQL (DML) statements that delete all new orders from exercise #12 based on order date.
-- Then delete “greek pizza” from the menu.

DELETE
FROM person_order
WHERE order_date BETWEEN '2022-02-16' AND '2022-02-24';

DELETE
FROM menu
WHERE pizza_name = 'greek_pizza';
