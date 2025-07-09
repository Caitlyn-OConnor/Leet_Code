WITH cte AS (
    SELECT * FROM seat
),
cte2 AS (
    SELECT * FROM seat
),
ctejoin AS (
    SELECT 
        s.*
        ,c1.id AS prev_id
        ,c1.student AS prev_student
        ,c2.id AS next_id
        ,c2.student AS next_student
        ,(SELECT COUNT(DISTINCT id) FROM seat) AS total
    FROM seat s
    LEFT JOIN cte c1 ON s.id = (c1.id + 1)
    LEFT JOIN cte2 c2 ON s.id = (c2.id - 1)
)

SELECT 
id
, case when id % 2 = 1 and id = total then student
    when id % 2 = 1 and id <> total then next_student
    when id % 2 = 0 then prev_student
    else student
    end as student
FROM ctejoin;



