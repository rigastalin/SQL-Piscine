-- Session #1
BEGIN TRANSACTION ISOLATION READ COMMITED;

-- Session #2
BEGIN TRANSACTION ISOLATION READ COMMITED;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';