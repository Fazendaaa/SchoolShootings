import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskOneOne from '../../queries/taskSix.sql';

/**
 * Task Six
 */
export const taskSix = async (client: Client): Promise<object> => {
    client.query('')
        .catch(console.error);

    return {};
};
