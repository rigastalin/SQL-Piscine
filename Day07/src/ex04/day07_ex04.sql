-- Please write a SQL statement that returns the person name and
-- corresponding number of visits in any pizzerias if the person has
-- visited more than 3 times (> 3).

SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(p.name) > 3;