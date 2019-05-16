import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
import loadSSUSA from '../tidia/Create-SSUSA.sql';

/**
 * Main
 *
 * @description
 * Takes the data provided then injects it into to PostgreSQL database
 *
 * @returns Whether or not the operation has been successfully completed
 */
const main = async (): Promise<boolean> => {
    const client = new Client({
        user: process.env.USER,
        database: process.env.DATABASE
    });

    await client.connect();

    client.query(loadSSUSA)
        .then(console.log)
        .catch(console.error);

    return true;
};

main()
    .then(console.log)
    .catch(console.error);
