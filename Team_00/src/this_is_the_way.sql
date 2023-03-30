CREATE TABLE this_is_the_way
(
    id bigint PRIMARY KEY ,
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL DEFAULT 0
);


INSERT INTO this_is_the_way VALUES (1, 'A', 'A', 0);
INSERT INTO this_is_the_way VALUES (2, 'A', 'B', 10);
INSERT INTO this_is_the_way VALUES (3, 'A', 'D', 20);
INSERT INTO this_is_the_way VALUES (4, 'A', 'C', 15);

INSERT INTO this_is_the_way VALUES (5, 'B', 'B', 0);
INSERT INTO this_is_the_way VALUES (6, 'B', 'A', 10);
INSERT INTO this_is_the_way VALUES (7, 'B', 'C', 35);
INSERT INTO this_is_the_way VALUES (8, 'B', 'D', 25);

INSERT INTO this_is_the_way VALUES (9, 'C', 'C', 0);
INSERT INTO this_is_the_way VALUES (10, 'C', 'A', 15);
INSERT INTO this_is_the_way VALUES (11, 'C', 'B', 35);
INSERT INTO this_is_the_way VALUES (12, 'C', 'D', 30);

INSERT INTO this_is_the_way VALUES (13, 'D', 'D', 0);
INSERT INTO this_is_the_way VALUES (14, 'D', 'A', 20);
INSERT INTO this_is_the_way VALUES (15, 'D', 'B', 25);
INSERT INTO this_is_the_way VALUES (16, 'D', 'C', 30);

SELECT *
FROM this_is_the_way;
