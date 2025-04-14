WITH cte AS (
    SELECT
        ISNULL(country, 'null') AS country_key,  -- for joining
        FORMAT(trans_date, 'yyyy-MM') AS month,
        COUNT(DISTINCT id) AS approved_count,
        SUM(amount) AS approved_total_amount
    FROM transactions
    WHERE state = 'approved'
    GROUP BY 
        ISNULL(country, 'null'),
        FORMAT(trans_date, 'yyyy-MM')
)

SELECT 
    FORMAT(t.trans_date, 'yyyy-MM') AS month,
    t.country,  -- original country (will show NULLs naturally)
    COUNT(t.id) AS trans_count,
    SUM(t.amount) AS trans_total_amount,
    COALESCE(MAX(cte.approved_count), 0) AS approved_count,
    COALESCE(MAX(cte.approved_total_amount), 0) AS approved_total_amount
FROM transactions t
LEFT JOIN cte
    ON FORMAT(t.trans_date, 'yyyy-MM') = cte.month
    AND ISNULL(t.country, 'null') = cte.country_key  -- match using surrogate key
GROUP BY 
    FORMAT(t.trans_date, 'yyyy-MM'),
    t.country;
