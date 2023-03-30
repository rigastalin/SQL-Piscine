-- Please find the names of persons who live on the same address. Make sure that the result
-- is ordered by 1st person, 2nd person's name and common address. The data sample is presented below.
-- Please make sure your column names are corresponding column names below.

WITH cte1(cte1_name, cte1_address, cte1_id) AS (SELECT name, address, id FROM person),
     cte2(cte2_name, cte2_address, cte2_id) AS (SELECT name, address, id FROM person)

SELECT cte1.cte1_name AS person_name1, cte2.cte2_name AS person_name2, cte1_address AS common_address
FROM cte1
JOIN cte2 ON cte1_address = cte2_address
WHERE cte1_name != cte2_name AND cte1_id > cte2_id
ORDER BY person_name1 ASC, person_name2;