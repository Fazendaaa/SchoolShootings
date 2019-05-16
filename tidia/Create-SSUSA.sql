-------------------------------------------------------------------------------------------------------
-- Caetano Traina Júnior -- Maio de 2019 --------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS SchoolShoots CASCADE;
CREATE TABLE SchoolShoots (
    UID  NUMERIC(4),  --  Unique identifier
    nces_school_id CHAR(14), --  National Center for Education Statistics unique school ID
    school_name TEXT, --  Name of school
    nces_district_id NUMERIC(14), --  National Center for Education Statistics unique district ID
    district_name TEXT, --  Name of school district
    date DATE, --  Date of shooting
    school_year CHAR(9), --  School year of shooting
    year NUMERIC(4), --  Year of shooting
    time TIME, --  Approximate time of shooting
    day_of_week VARCHAR(9), --  Day of week of shooting
    city TEXT, --  City where school is located
    state TEXT, --  State where school is located
    school_type CHAR(7), --  Type of school: public, private
    enrollment CHAR(5), --  Enrollment at school at time of shooting
    killed NUMERIC(4), --  Number killed in shooting (excludes shooter)
    injured NUMERIC(4), --  Number injured in shooting (excludes shooter)
    casualties NUMERIC(4), --  Number killed and injured in shooting (excludes shooter)
    shooting_type TEXT, --  Type of shooting:
                               -- accidental, Gun discharged accidentally
                               -- hostage suicide, Shooter took hostages before attempting suicide
                               -- indiscriminate, Shooter fired weapon purposefully but without intended victim(s)
                               -- public suicide, Shooter attempted suicide in public space
                               -- targeted, Shooter fired weapon purposefully with intended victim(s)
                               -- unclear, Type of shooting unknown
    age_shooter1 NUMERIC(2), --  Age of first shooter
    gender_shooter1 CHAR, --  Gender of first shooter: m, f
    race_ethnicity_shooter1 CHAR(2), --  Race or ethnicity of first shooter:
                               -- a, Asian
                               -- ai, American Indian
                               -- b, Black
                               -- h, Hispanic
                               -- w, White
    shooter_relationship1 TEXT, --  First shooter's relationship to school
    shooter_deceased1 CHAR, --  Flag indicating whether first shooter died in shooting:
                               -- 1, Shooter died in shooting
                               -- 0, Shooter did not die or shooter status unknown
    deceased_notes1 TEXT, --  If first shooter deceased, how first shooter died
    age_shooter2 NUMERIC(2), --  Age of second shooter
    gender_shooter2 CHAR, --  Gender of second shooter: m, f
    race_ethnicity_shooter2 CHAR(2), --  Race or ethnicity of second shooter:
                               -- a, Asian
                               -- ai, American Indian
                               -- b, Black
                               -- h, Hispanic
                               -- w, White
    shooter_relationship2 TEXT, --  Second shooter's relationship to school
    shooter_deceased2 CHAR, --  Flag indicating whether second shooter died in shooting:
                               -- 1, Shooter died in shooting
                               -- 0, Shooter did not die or shooter status unknown
    deceased_notes2 TEXT, --  If second shooter deceased, how first shooter died
    white CHAR(6), --  Enrollment of white students at time of shooting
    black CHAR(6), --  Enrollment of black students at time of shooting
    hispanic CHAR(6), --  Enrollment of Hispanic students at time of shooting
    asian CHAR(6), --  Enrollment of Asian students at time of shooting
    american_indian_alaska_native CHAR(6), --  Enrollment of American Indian and Alaskan native students at time of shooting
    hawaiian_native_pacific_islander CHAR(6), --  Enrollment of Hawaiian native and Pacific islander students at time of shooting (unavailable prior to 2009)
    two_or_more CHAR(6), --  Enrollment of students of two or more races at time of shooting (unavailable prior to 2009)
    resource_officer CHAR, --  Flag indicating presence of school resource officer or security guard on school grounds at time of shooting:
                               -- 1, Resource officer of security guard present at school at time of shooting
                               -- 0, Resource officer of security guard not present at school at time of shooting or presence unknown
    weapon TEXT, --  Weapon(s) used in shooting
    weapon_source TEXT, --  Where shooter acquired weapon(s) used in shooting
    lat FLOAT, --  Latitude of school
    long FLOAT, --  Longitude of school
    staffing TEXT, --  Full-time equivalent teachers at school at time of shooting
    low_grade  CHAR(2), --  Lowest grade-level offered by school
    high_grade  CHAR(2), --  Highest grade-level offered at time of shooting
    lunch CHAR(4), --  Number of students at school eligible to receive a free or reduced-price lunch
    county TEXT, --  County name where school is located
    state_fips NUMERIC(2), --  Two-digit state Federal Information Processing Standards code
    county_fips NUMERIC(5), --  Five-digit county Federal Information Processing Standards code
    ulocale  NUMERIC(2) --  National Center for Education Statistics urban-centric locale code:
                               -- 11, City, Large Territory inside an urbanized area and inside a principal city with population of 250, 000 or more.
                               -- 12, City, Mid-size Territory inside an urbanized area and inside a principal city with a population less than 250, 000 and greater than or equal to 100, 000.
                               -- 13, City, Small Territory inside an urbanized area and inside a principal city with a population less than 100, 000.
                               -- 21, Suburb, Large Territory outside a principal city and inside an urbanized area with population of 250, 000 or more.
                               -- 22, Suburb, Mid-size Territory outside a principal city and inside an urbanized area with a population less than 250, 000 and greater than or equal to 100, 000.
                               -- 23, Suburb, Small Territory outside a principal city and inside an urbanized area with a population less than 100, 000.
                               -- 31, Town, Fringe Territory inside an urban cluster that is less than or equal to 10 miles from an urbanized area.
                               -- 32, Town, Distant Territory inside an urban cluster that is more than 10 miles and less than or equal to 35 miles from an urbanized area.
                               -- 33, Town, Remote Territory inside an urban cluster that is more than 35 miles from an urbanized area.
                               -- 41, Rural, Fringe Census-defined rural territory that is less than or equal to 5 miles from an urbanized area, as well as rural territory that is less than or equal to 2.5 miles from an urban cluster.
                               -- 42, Rural, Distant Census-defined rural territory that is more than 5 miles but less than or equal to 25 miles from an urbanized area, as well as rural territory that is more than 2.5 miles but less than or equal to 10 miles from an urban cluster.
                               -- 43, Rural, Remote Census-defined rural territory that is more than 25 miles from an urbanized area and is also more than 10 miles from an urban cluster.
    );

SET datestyle = "ISO, MDY";
COPY SchoolShoots 
    FROM '..path\School-Shootings-Data.csv' CSV HEADER;
SET datestyle = "ISO, DMY";