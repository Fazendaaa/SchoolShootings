SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY age_shooter1)
    FROM SchoolShoots
    WHERE age_shooter1 IS NOT NULL;
