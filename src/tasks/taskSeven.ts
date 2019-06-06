import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskOneOne from '../../queries/taskSeven.sql';

/**
 * Task Seven
 */
export const taskSeven = async (client: Client): Promise<object> => {
    client.query('')
        .catch(console.error);

    return {};
};
