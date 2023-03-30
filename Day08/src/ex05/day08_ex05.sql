-- Session #1
BEGIN TRANSACTION ISOLATION READ COMMITED;

-- Session #2
BEGIN TRANSACTION ISOLATION READ COMMITED;

-- Session #1
SELECT SUM(rating) FROM pizzeria;

-- Session #2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

COMMIT;

-- Session #1
SELECT SUM(rating) FROM pizzeria;

COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- Session #2
SELECT SUM(rating) FROM pizzeria;