-- Please write a SQL statement which satisfies a formula (R - S)∪(S - R) .
-- Where R is the person_visits table with filter by 2nd of January 2022, S is also person_visits
-- table but with a different filter by 6th of January 2022. Please make your calculations with
-- sets under the person_id column and this column will be alone in a result. The result please
-- sort by person_id column and your final SQL please present in v_symmetric_union (*) database view.
-- (*) to be honest, the definition “symmetric union” doesn’t exist in Set Theory. This is
-- the author's interpretation, the main idea is based on the existing rule of symmetric difference.

CREATE VIEW v_symmetric_union AS

WITH R(col1) AS (SELECT pv.person_id FROM person_visits pv WHERE visit_date = '2022-01-02'),
     S(col2) AS (SELECT pv2.person_id FROM person_visits pv2 WHERE visit_date = '2022-01-06')

(SELECT col1 AS person_id
FROM R
EXCEPT
SELECT col2
FROM S)
UNION ALL
(SELECT col2
FROM S
EXCEPT
SELECT col1
FROM R)
ORDER BY person_id;