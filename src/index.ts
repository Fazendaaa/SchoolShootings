import { exec } from 'child_process';
import { Client } from 'pg';
import { promisify } from 'util';
// tslint:disable: match-default-export-name
import loadSSUSAOne from '../tidia/Create-SSUSA.1.sql';
import loadSSUSATwo from '../tidia/Create-SSUSA.2.sql';
import loadSSUSAThree from '../tidia/Create-SSUSA.3.sql';
import loadSSUSAFive from '../tidia/Create-SSUSA.5.sql';
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

    await client.query('SELECT * FROM SchoolShoots;')
        .then(console.log)
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

    return true;
};

main()
    .then(console.log)
    .catch(console.error);
