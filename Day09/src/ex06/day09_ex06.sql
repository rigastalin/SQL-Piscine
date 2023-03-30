CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
                                                    pprice INTEGER DEFAULT 500,
                                                    pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(name VARCHAR) AS $$
    BEGIN
        RETURN QUERY SELECT DISTINCT p.name
        FROM pizzeria pi
        JOIN person_visits pv ON pi.id = pv.pizzeria_id
        JOIN person p ON p.id = pv.person_id
        JOIN menu m ON pi.id = m.pizzeria_id
        WHERE pv.visit_date = pdate AND m.price < pprice AND p.name = pperson;
    END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-- drop function fnc_person_visits_and_eats_on_date(varchar, integer, date);