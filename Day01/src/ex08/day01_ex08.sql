SELECT od.order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM person
NATURAL JOIN
    (SELECT order_date, person_id AS id FROM person_order) AS od
ORDER BY order_date ASC, person_information ASC;