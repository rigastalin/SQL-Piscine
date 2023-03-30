-- Please write a SQL statement which returns the missing days from 1st to 10th of January 2022 (including all days) for visits of persons with identifiers 1 or 2. Please order by visiting days in ascending mode. The sample of data with column name is presented below.

SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS missing_date
LEFT JOIN
    (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) as date
ON missing_date = date.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date ASC;
