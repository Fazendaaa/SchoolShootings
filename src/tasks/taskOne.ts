import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
import taskOneOne from '../../queries/taskOne.sql';

/**
 * Task One
 */
export const taskOne = async (client: Client): Promise<boolean> => {
    client.query(taskOneOne)
        .catch(console.error);

    return true;
};
