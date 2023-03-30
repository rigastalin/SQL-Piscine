-- Please register new orders from Denis and Irina on 24th of February 2022 for the new menu with “sicilian pizza”.

INSERT INTO person_order VALUES (
        (SELECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE person.name = 'Denis'),
        (SELECT id FROM menu WHERE menu.pizza_name = 'sicilian pizza'),
        '2022-02-24'
    );

INSERT INTO person_order VALUES (
        (SELECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE person.name = 'Irina'),
        (SELECT id FROM menu WHERE menu.pizza_name = 'sicilian pizza'),
        '2022-02-24'
);
