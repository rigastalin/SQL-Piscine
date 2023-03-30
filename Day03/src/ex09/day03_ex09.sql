-- Please register new visits into Domino's restaurant from Denis and Irina on 24th of February 2022.

INSERT INTO person_visits VALUES (
        (SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE person.name = 'Denis'),
        (SELECT id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
        '2022-02-24'
    );

INSERT INTO person_visits VALUES (
        (SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE person.name = 'Irina'),
        (SELECT id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
        '2022-02-24'
    );