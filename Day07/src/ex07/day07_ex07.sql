-- Please write a SQL statement that returns a common average rating
-- (the output attribute name is global_rating) for all restaurants.
-- Round your average rating to 4 floating numbers.

SELECT ROUND(SUM(p.rating) / MAX(p.id), 4) AS global_rating
FROM pizzeria p;
