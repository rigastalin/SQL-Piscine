-- Please create a functional B-Tree index with name idx_person_name for the column name of the person table.
-- Index should contain person names in upper case.

-- Please write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_person_name is working.
CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT name
FROM person
WHERE UPPER(name) = 'Kate';