-------------------------------------------------------------------------------------------------------
-- Caetano Traina Júnior -- Maio de 2019 --------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------
DROP TABLE IF EXISTS USCensus CASCADE;
CREATE TABLE USCensus(
	Id INTEGER,
	City TEXT,
	State TEXT,
    Kind TEXT,    -- City, Village, Borough, etc.
	Lat NUMERIC,
	Long NUMERIC,
	Total_Population NUMERIC,
	  -- Age Attributes
	Female NUMERIC,
	Male NUMERIC,
	Under_5y NUMERIC,
	age_5y_9y NUMERIC,
	age_10y_14y NUMERIC,
	age_15y_19y NUMERIC,
	age_20y_24y NUMERIC,
	age_25y_34y NUMERIC,
	age_35y_44y NUMERIC,
	age_45y_54y NUMERIC,
	age_55y_59y NUMERIC,
	age_60y_64y NUMERIC,
	age_65y_74y NUMERIC,
	age_75y_84y NUMERIC,
	age_85y_AndOver NUMERIC,
	Average_age NUMERIC,
	age_18y_AndOver NUMERIC,
	age_18y_AndOverMale NUMERIC,
	age_18y_AndOverFemale NUMERIC,
	age_21y_AndOver NUMERIC,
	age_62y_AndOver NUMERIC,
	age_65y_AndOver NUMERIC,
	age_65y_AndOverMale NUMERIC,
	age_65y_AndOverFemale NUMERIC,
	  -- Race Attributes
	one_race NUMERIC,
	white_race NUMERIC,
	black_orAfrican_race NUMERIC,
	AmericanIndican_AlaskaNative NUMERIC,
	Asian NUMERIC,
	asian_indian NUMERIC,
	asian_chinese NUMERIC,
	asian_filipino NUMERIC,
	asian_japanese NUMERIC,
	asian_korean NUMERIC,
	asian_vietnamese NUMERIC,
	asian_others NUMERIC,
	NativeHawaiian_OtherPacificIslander NUMERIC,
	Native_hawaiian NUMERIC,
	guamanian_chamorro NUMERIC,
	samoan NUMERIC,
	other_pacific_islander NUMERIC,
	other_race NUMERIC,
	two_orMoreRace NUMERIC,
	    --Race alone or in combination with one or more other race(RAorOneOrMore)
	RAorOneOrMore_white NUMERIC,
	RAorOneOrMore_black NUMERIC,
	RAorOneOrMore_americanIndian_alaska NUMERIC,
	RAorOneOrMore_asian NUMERIC,
	RAorOneOrMore_nativehawaiian_otherpacific NUMERIC,
	RAorOneOrMore_otherrace NUMERIC,
	    --Hispanic or Latino race(HispLat)
	total_population2 NUMERIC,
	HispLat NUMERIC,
	HispLat_mexican NUMERIC,
	HispLat_puertoRican NUMERIC,
	HispLat_cuban NUMERIC,
	HispLat_others NUMERIC,
	HispLat_not NUMERIC,
	HispLat_whitealone NUMERIC,
	  --Relationship(re)
	re_total NUMERIC,
	    --In household(h)
	re_h  NUMERIC,
	re_h_householder NUMERIC,
	re_h_spouse NUMERIC,
	re_h_child NUMERIC,
	re_h_child_own_under18 NUMERIC,
	re_h_otherrelative NUMERIC,
	re_h_otherrelative_under18 NUMERIC,
	re_h_nonrelatives NUMERIC,
	re_h_nonrelatives_unmarried NUMERIC,
	    --In group quarters
	re_g NUMERIC,
	re_g_institutionalized NUMERIC,
	re_g_noninstitutionalized NUMERIC,
	  --Household by type(HBT)
	hbt_total NUMERIC,
	hbt_family NUMERIC,
	hbt_family_children NUMERIC,
	hbt_family_married NUMERIC,
	hbt_family_married_children NUMERIC,
	hbt_family_femaleNoHusband NUMERIC,
	hbt_family_femaleNoHusband_children NUMERIC,
	hbt_nonfamily NUMERIC,
	hbt_nonfamily_alone NUMERIC,
	hbt_nonfamily_65yover NUMERIC,
	hbt_individuals_under18y NUMERIC,
	hbt_individuals_over65y NUMERIC,
	hbt_average_householdsize NUMERIC,
	hbt_average_familysize NUMERIC,
	    --Housing occupancy(HO)
	ho_total NUMERIC,
	ho_occupied NUMERIC,
	ho_vacant NUMERIC,
	ho_vacant_seasonal_recreational_occasional NUMERIC,
	ho_homeowner_vacancy_rate NUMERIC,
	ho_rental_vacancy_rate NUMERIC,
	    --Housing Tenure(HT)
	ht_occupied NUMERIC,
	ht_owner_occupied NUMERIC,
	ht_renter_occupied NUMERIC,
	ht_average_household_size_owner_occupied NUMERIC,
	ht_average_household_size_renter_occupied NUMERIC
);

-----------------------------------------------------------------------------
COPY USCensus (Id, City, State, Total_Population, Female, Male, Under_5y, age_5y_9y, age_10y_14y, age_15y_19y, age_20y_24y, age_25y_34y, age_35y_44y, age_45y_54y, age_55y_59y, age_60y_64y, age_65y_74y, age_75y_84y, age_85y_AndOver, Average_age, age_18y_AndOver, age_18y_AndOverMale, age_18y_AndOverFemale, age_21y_AndOver, age_62y_AndOver, age_65y_AndOver, age_65y_AndOverMale, age_65y_AndOverFemale, one_race, white_race, black_orAfrican_race, AmericanIndican_AlaskaNative, Asian, asian_indian, asian_chinese, asian_filipino, asian_japanese, asian_korean, asian_vietnamese, asian_others, NativeHawaiian_OtherPacificIslander, Native_hawaiian, guamanian_chamorro, samoan, other_pacific_islander, other_race, two_orMoreRace, RAorOneOrMore_white, RAorOneOrMore_black, RAorOneOrMore_americanIndian_alaska, RAorOneOrMore_asian, RAorOneOrMore_nativehawaiian_otherpacific, RAorOneOrMore_otherrace, total_population2, HispLat, HispLat_mexican, HispLat_puertoRican, HispLat_cuban, HispLat_others, HispLat_not, HispLat_whitealone, re_total, re_h, re_h_householder, re_h_spouse, re_h_child, re_h_child_own_under18, re_h_otherrelative, re_h_otherrelative_under18, re_h_nonrelatives, re_h_nonrelatives_unmarried, re_g, re_g_institutionalized, re_g_noninstitutionalized, hbt_total, hbt_family, hbt_family_children, hbt_family_married, hbt_family_married_children, hbt_family_femaleNoHusband, hbt_family_femaleNoHusband_children, hbt_nonfamily, hbt_nonfamily_alone, hbt_nonfamily_65yover, hbt_individuals_under18y, hbt_individuals_over65y, hbt_average_householdsize, hbt_average_familysize, ho_total, ho_occupied,     ho_vacant, ho_vacant_seasonal_recreational_occasional, ho_homeowner_vacancy_rate, ho_rental_vacancy_rate, ht_occupied, ht_owner_occupied, ht_renter_occupied, ht_average_household_size_owner_occupied, ht_average_household_size_renter_occupied, Lat, Long)
FROM 'E:\SolD\@Caetano\@Disciplinas\SCC0240-2019-BD-BCC\Trab-1\Dados Trab1-USShoolShots\USCities-2kCensus.txt' DELIMITER ' ' NULL '\N' CSV;

UPDATE USCensus SET City = REGEXP_REPLACE(SubString(City,'(.*)_.*$'), '_', ' ','g'),
                    Kind = Lower(SubString(City,'.*_(.*)$'));
    --SELECT USCensus.City, USCensus.Kind FROM USCensus WHERE State='WI';

--============================================================================================================================================
DROP TABLE IF EXISTS USStates CASCADE;
CREATE TABLE USStates(
    StateName TEXT,
	State CHAR(2),
	Capital TEXT,
	Lat NUMERIC,
	Long NUMERIC,
	CensusRegion CHAR,
	CensusRegionName TEXT,
	CensusDivision CHAR(2),
	CensusDivisionName TEXT,
	HouseSeats NUMERIC
);
COPY USStates FROM 'E:\SolD\@Caetano\@Disciplinas\SCC0240-2019-BD-BCC\Trab-1\Dados Trab1-USShoolShots\States.csv' DELIMITER E'\t' NULL '\N' CSV HEADER;

-----------------------------------------------------------------------------
SELECT Count(*), 'USCensus' As Table FROM USCensus UNION
SELECT Count(*), 'USStates' As Table FROM USStates;

SELECT * 
    FROM USStates left JOIN USCensus 
	     ON USStates.State = USCensus.State AND 
	        USStates.Capital = USCensus.City
    ORDER BY USStates.State

