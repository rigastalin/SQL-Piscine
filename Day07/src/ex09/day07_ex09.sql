-- Please write a SQL statement that returns aggregated information
-- by person’s address , the result of “Maximal Age - (Minimal Age /
-- Maximal Age)” that is presented as a formula column, next one is average
-- age per address and the result of comparison between formula and average
-- columns (other words, if formula is greater than average then True,
-- otherwise False value).

-- The result should be sorted by address column.

SELECT p.address AS address,
       ROUND(MAX(p.age) * 1.0 - (MIN(p.age) * 1.0 / MAX(p.age)), 2) AS formula,
       ROUND(AVG(p.age), 2) AS average,
       ROUND(MAX(p.age) * 1.0 - (MIN(p.age) * 1.0 / MAX(p.age)), 2) > ROUND(AVG(p.age), 2) AS comparison
FROM person p
GROUP BY address
ORDER BY address ASC;