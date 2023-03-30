DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female') RETURNS SETOF person AS $$
SELECT *
FROM person
WHERE gender = pgender
$$ LANGUAGE SQL;

-- select *
-- from fnc_persons(pgender := 'male');
--
-- select *
-- from fnc_persons();