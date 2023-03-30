CREATE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10) RETURNS INT[] AS $$
DECLARE
    arr int[];
    x INT := 0;
    x1 INT := 1;

BEGIN
    arr = arr || 0;
    WHILE x1 < pstop
        LOOP
        arr = arr || x1;
        x1 := x + x1;
        x := x1 - x;
        END LOOP;
    RETURN arr;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();