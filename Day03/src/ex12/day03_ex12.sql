-- Please register new orders from all persons for “greek pizza” by 25th of February 2022.

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series(((SELECT MAX(id) FROM person_order) + 1),
                        (SELECT MAX(id) FROM person_order) + (SELECT  MAX(id) FROM person)),
        generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)),
        (SELECT menu.id FROM menu WHERE pizza_name = 'greek pizza'),
        generate_series('2022-02-16', '2022-02-24', INTERVAL '1 day')
