WITH first_logins AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_login_date
    FROM activity
    GROUP BY player_id
),
next_day_logins AS (
    SELECT 
        f.player_id
    FROM first_logins f
    JOIN activity a 
        ON f.player_id = a.player_id
        AND a.event_date = DATEADD(day, 1, f.first_login_date)
)

SELECT 
    ROUND(COUNT(DISTINCT next_day_logins.player_id) * 1.0 / COUNT(DISTINCT activity.player_id), 2) AS fraction
FROM activity
LEFT JOIN next_day_logins ON next_day_logins.player_id = activity.player_id;
