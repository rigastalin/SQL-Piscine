-- Let’s return back to Exercise #01, please rewrite your SQL by using the CTE (Common Table Expression) pattern.
-- Please move into the CTE part of your "day generator". The result should be similar like in Exercise #01

WITH cte_1(missing_date) AS (SELECT * FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS missing_date),
cte_2(d_d) AS (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2)

SELECT missing_date::date FROM cte_1
LEFT JOIN cte_2
ON cte_2.d_d = cte_1.missing_date
WHERE cte_2.d_d IS NULL
ORDER BY cte_2.d_d ASC;
