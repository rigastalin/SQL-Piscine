-- Please register a new pizza with name “sicilian pizza” (whose id should be calculated by
-- formula is “maximum id value + 1”) with a price of 900 rubles in “Domino's” restaurant
-- (please use internal query to get identifier of pizzeria).
-- Warning: this exercise will probably be the cause  of changing data in the wrong way.
-- Actually, you can restore the initial database model with data from the link in the
-- “Rules of the day” section and replay script from Exercise 07.

INSERT INTO menu VALUES (
        (SELECT MAX(menu.id) FROM menu) + 1, (SELECT p.id FROM pizzeria p WHERE p.name = 'Dominos'), 'sicilian pizza', 900
    );