-- Before further steps please write a SQL statement that returns pizzas’ and corresponding pizzeria names.
-- Please take a look at the sample result below (no sort needed).

-- Let’s provide proof that your indexes are working for your SQL. The sample of proof is the output of the
-- EXPLAIN ANALYZE command. Please take a look at the sample output command.

-- Hint: please think why your indexes are not working in a direct way and what should we do to enable it?
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id