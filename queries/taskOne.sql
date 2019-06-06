SELECT race_ethnicity_shooter1 FROM SchoolShoots
    WHERE race_ethnicity_shooter1
    IS NOT NULL AND 'b ' = race_ethnicity_shooter1;

SELECT SUM(black) FROM
    (SELECT CAST(black AS INT)
        FROM SchoolShoots) as SubQuery;
