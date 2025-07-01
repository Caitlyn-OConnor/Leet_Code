WITH cte AS (
    SELECT *,
           SUM(weight) OVER (ORDER BY turn) AS sum
    FROM queue
),
cte2 AS (
    SELECT *
    FROM cte
    WHERE sum <= 1000
)
SELECT person_name
FROM cte2
WHERE turn = (SELECT MAX(turn) FROM cte2);
