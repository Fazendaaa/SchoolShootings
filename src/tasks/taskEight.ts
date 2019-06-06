import { Client, QueryResult } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskOneOne from '../../queries/taskEight.sql';

const greatCircleDistance = async (client: Client): Promise<QueryResult> =>
    client.query('CREATE OR REPLACE FUNCTION GCD(ALat Numeric, ALong Numeric, BLat Numeric, BLong Numeric) \
    RETURNS DOUBLE PRECISION \
    AS $$ \
        SELECT ROUND(6372795.477598*( \
            ACOS(SIN(ALat*3.1416/180)*SIN(BLat*3.1416/180) + \
                 COS(ALat*3.1416/180)*COS(BLat*3.1416/180)*COS(ALong*3.1416/180-BLong*3.1416/180.)) \
            ))/1000;  \
    $$ \
    LANGUAGE SQL \
    IMMUTABLE \
    RETURNS NULL ON NULL INPUT;');

/**
 * Task Eight
 */
export const taskEight = async (client: Client): Promise<object> => {
    await greatCircleDistance(client);

    client.query('')
        .catch(console.error);

    return {};
};
