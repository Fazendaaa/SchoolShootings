import { Client } from 'pg';

/**
 * Main
 *
 * @description
 * Takes the data provided then injects it into to Postegree database
 *
 * @returns Whether or not the operation has been successfully completed
 */
const main = async (): Promise<boolean> => {
    const client = new Client();

    await client.connect();

    return true;
};

main()
    .then(console.log)
    .catch(console.error);
