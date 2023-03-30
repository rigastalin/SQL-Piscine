-- Please change a SQL statement from Exercise 00 and
-- return a person name (not identifier). Additional clause is we
-- need to see only top-4 persons with maximal visits in any
-- pizzerias and sorted by a person name.

SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p on pv.person_id = p.id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name ASC
LIMIT 4;
