--- Exploratory Data Analysis
SELECT ts, platform, ms_played, 
track_name, artist_name, album_name,
reason_start, reason_end, shuffle, skipped
FROM spotify_cleaned;
----------------------------------------------------
---Criterion: 
---+) Top artists in per year.
---+) Most_played and skip rates
---+) Typical listening time of day
---+) Exploration (New Artists) vs. Replaying 

(---Top artists per year.)
WITH Top_artist_per_year AS ( SELECT 
    YEAR(ts) AS listened_year,
    artist_name,
    SUM(ms_played) / 60000.0 AS minutes_played,
    -- Rank artists within each year
    RANK() OVER (PARTITION BY YEAR(ts) ORDER BY SUM(ms_played) DESC) AS rank
FROM 
    spotify_cleaned
GROUP BY 
    YEAR(ts), artist_name  -- Repeating the function for maximum compatibility
    )

SELECT * FROM Top_artist_per_year
ORDER BY 
    listened_year DESC, 
    rank ASC;

---Most_played and skip rates:
WITH most_played_and_skipped_rates as (
    SELECT 
    track_name,
    artist_name,
    COUNT(*) as total_plays,
    SUM(CASE WHEN skipped = 'True' THEN 1 ELSE 0 END) as total_skips,
    Round((CAST(SUM(CASE WHEN skipped = 'True' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100, 2) as skip_rate_percentage
FROM 
    spotify_cleaned
GROUP BY 
    track_name, artist_name
HAVING 
    COUNT(*) > 5  -- Filter to ignore songs played only once
)

SELECT * FROM most_played_and_skipped_rates
    ORDER BY 
    total_plays DESC;

---+) Typical listening time of day:
    WITH listening_time_of_day AS (
    SELECT 
        DATEPART(hour, ts) AS hour_of_day, -- Use DATEPART instead of HOUR
        COUNT(*) AS tracks_played,
        SUM(ms_played) / 3600000.0 AS hours_listened
    FROM spotify_cleaned
    GROUP BY 
        DATEPART(hour, ts) -- Must match the SELECT clause
)

SELECT 
    hour_of_day,
    tracks_played,
    hours_listened,
    -- Adding the Time Blocks for better Power BI visuals
    CASE 
        WHEN hour_of_day BETWEEN 6 AND 11  THEN 'Morning'
        WHEN hour_of_day BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN hour_of_day BETWEEN 18 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_category
FROM listening_time_of_day
ORDER BY hour_of_day;

---+) Exploration (New Artists) vs. Replaying per month:
WITH Artist_Discovery AS (
    SELECT 
        ts,
        artist_name,
        -- Row number 1 is the first time this artist appears in your history
        ROW_NUMBER() OVER (PARTITION BY artist_name ORDER BY ts) as artist_play_rank
    FROM 
        spotify_cleaned
)

SELECT 
    -- Truncate to the first day of the month
    YEAR(ts) as year,
    CASE 
        WHEN artist_play_rank = 1 THEN 'New Discovery' 
        ELSE 'Replay' 
    END as listen_type,
    COUNT(*) as play_count
FROM 
    Artist_Discovery
GROUP BY 
    YEAR(ts), 
    CASE WHEN artist_play_rank = 1 THEN 'New Discovery' ELSE 'Replay' END
ORDER BY 
    year ASC;
