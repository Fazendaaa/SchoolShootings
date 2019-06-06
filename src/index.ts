import { exec } from 'child_process';
import { Client } from 'pg';
import { promisify } from 'util';
// tslint:disable: match-default-export-name
import loadSSUSAOne from '../tidia/Create-SSUSA.1.sql';
import loadSSUSATwo from '../tidia/Create-SSUSA.2.sql';
import loadSSUSAThree from '../tidia/Create-SSUSA.3.sql';
import loadSSUSAFive from '../tidia/Create-SSUSA.5.sql';
import loadUSCitiesOne from '../tidia/Create-USCities.1.sql';
import loadUSCitiesTwo from '../tidia/Create-USCities.2.sql';
import loadUSCitiesThree from '../tidia/Create-USCities.3.sql';
import loadUSCitiesFour from '../tidia/Create-USCities.4.sql';
import loadUSCitiesFive from '../tidia/Create-USCities.5.sql';
import loadUSCitiesSix from '../tidia/Create-USCities.6.sql';
import loadUSCitiesSeven from '../tidia/Create-USCities.7.sql';
// tslint:enable: match-default-export-name

const asyncExec = promisify(exec);

/**
 * Load SSUSA
 *
 * @description
 * Loads the SSUSA data into the DB
 *
 * @returns Whether or not the operation has been successfully completed
 */
const loadSSUSA = async (database: string, client: Client): Promise<boolean> => {
    const csvFile = '/tmp/school-shootings-data.csv';

    /**
     * https://github.com/brianc/node-pg-cursor/issues/9#issuecomment-109296720
     */
    await client.query(loadSSUSAOne)
        .catch(console.error);
    await client.query(loadSSUSATwo)
        .catch(console.error);
    await client.query(loadSSUSAThree)
        .catch(console.error);

    /**
     * The Create-SSUSA.4.sql cannot be performed because the files are not yet
     * presented in the Postgres server; that's why this script.
     *
     * https://stackoverflow.com/a/40334795/7092954
     */
    await asyncExec(`psql -d ${database} -U farm -c \"COPY SchoolShoots \
                     FROM STDIN CSV HEADER\" < ${csvFile}`);

    await client.query(loadSSUSAFive)
        .catch(console.error);

    await client.query('COMMIT;')
        .catch(console.error);

    return true;
};

/**
 * Load the US Cities
 *
 * @description
 * Loads the US Cities data into the DB
 *
 * @returns Whether or not the operation has been successfully completed
 */
const createUSCensus = async (database: string, client: Client): Promise<boolean> => {
    const fileCensus = '/tmp/USCities-2kCensus.txt';
    const fileStates = '/tmp/States.csv';

    await client.query(loadUSCitiesOne)
        .catch(console.error);

    await client.query(loadUSCitiesTwo)
        .catch(console.error);

    await asyncExec(`psql -d ${database} -U farm -c \"COPY USCensus (Id, City, State, Total_Population, Female, Male, Under_5y, age_5y_9y, age_10y_14y, age_15y_19y, age_20y_24y, age_25y_34y, age_35y_44y, age_45y_54y, age_55y_59y, age_60y_64y, age_65y_74y, age_75y_84y, age_85y_AndOver, Average_age, age_18y_AndOver, age_18y_AndOverMale, age_18y_AndOverFemale, age_21y_AndOver, age_62y_AndOver, age_65y_AndOver, age_65y_AndOverMale, age_65y_AndOverFemale, one_race, white_race, black_orAfrican_race, AmericanIndican_AlaskaNative, Asian, asian_indian, asian_chinese, asian_filipino, asian_japanese, asian_korean, asian_vietnamese, asian_others, NativeHawaiian_OtherPacificIslander, Native_hawaiian, guamanian_chamorro, samoan, other_pacific_islander, other_race, two_orMoreRace, RAorOneOrMore_white, RAorOneOrMore_black, RAorOneOrMore_americanIndian_alaska, RAorOneOrMore_asian, RAorOneOrMore_nativehawaiian_otherpacific, RAorOneOrMore_otherrace, total_population2, HispLat, HispLat_mexican, HispLat_puertoRican, HispLat_cuban, HispLat_others, HispLat_not, HispLat_whitealone, re_total, re_h, re_h_householder, re_h_spouse, re_h_child, re_h_child_own_under18, re_h_otherrelative, re_h_otherrelative_under18, re_h_nonrelatives, re_h_nonrelatives_unmarried, re_g, re_g_institutionalized, re_g_noninstitutionalized, hbt_total, hbt_family, hbt_family_children, hbt_family_married, hbt_family_married_children, hbt_family_femaleNoHusband, hbt_family_femaleNoHusband_children, hbt_nonfamily, hbt_nonfamily_alone, hbt_nonfamily_65yover, hbt_individuals_under18y, hbt_individuals_over65y, hbt_average_householdsize, hbt_average_familysize, ho_total, ho_occupied,     ho_vacant, ho_vacant_seasonal_recreational_occasional, ho_homeowner_vacancy_rate, ho_rental_vacancy_rate, ht_occupied, ht_owner_occupied, ht_renter_occupied, ht_average_household_size_owner_occupied, ht_average_household_size_renter_occupied, Lat, Long) \
                     FROM STDIN DELIMITER \' \' NULL \'\N\' CSV;" < ${fileCensus}`);

    await client.query(loadUSCitiesThree)
        .catch(console.error);

    await client.query(loadUSCitiesFour)
        .catch(console.error);

    await client.query(loadUSCitiesFive)
        .catch(console.error);

    await asyncExec(`psql -d ${database} -U farm -c \"COPY USStates FROM STDIN DELIMITER E'\t' NULL '\N' CSV HEADER;" < ${fileStates}`);

    await client.query(loadUSCitiesSix)
        .catch(console.error);

    await client.query(loadUSCitiesSeven)
        .catch(console.error);

    return true;
};

/**
 * Main
 *
 * @description
 * Takes the data provided then injects it into to Postgres database
 *
 * @returns Whether or not the operation has been successfully completed
 */
const main = async (): Promise<boolean> => {
    const database = <string> process.env.DATABASE;
    const client = new Client({
        database,
        user: process.env.USER
    });

    await client.connect();

    loadSSUSA(database, client)
        .catch(console.error);

    createUSCensus(database, client)
        .catch(console.error);

    return true;
};

main()
    .then(console.log)
    .catch(console.error);
