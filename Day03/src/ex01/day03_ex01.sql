-- Please find all menu identifiers which are not ordered by anyone.
-- The result should be sorted by identifiers. The sample of output data is presented below.

SELECT menu.id AS id
FROM menu
EXCEPT
SELECT po.menu_id
FROM person_order po
ORDER BY id ASC;