WITH RECURSIVE my_way(ci1, ci2, way, total_cost, lev) AS (
    (SELECT point1, point1, '{' || point1, this_is_the_way.cost, 1
    FROM this_is_the_way
    WHERE point1 = 'A'
    AND point2 = 'A')
    UNION ALL
    (SELECT point1, point2, my_way.way || ',' || this_is_the_way.point2,
            my_way.total_cost + this_is_the_way.cost,
            lev + 1
    FROM
         my_way
    JOIN this_is_the_way ON my_way.ci2 = this_is_the_way.point1
    WHERE (lev < 4 OR (lev = 4 AND this_is_the_way.point2 = 'A'))
    AND this_is_the_way.cost > 0
    AND my_way.ci1 != this_is_the_way.point2))

SELECT total_cost, way || '}' AS tour
FROM my_way
WHERE lev = 5
ORDER BY total_cost ASC, tour ASC;