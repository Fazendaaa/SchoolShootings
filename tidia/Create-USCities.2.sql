-------------------------------------------------------------------------------------------------------
-- Caetano Traina Júnior -- Maio de 2019 --------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------
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