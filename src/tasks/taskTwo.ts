import { Client } from 'pg';

interface Percentile {
    readonly percentile_cont: number;
}

/**
 * Task Two
 *
 * https://stackoverflow.com/a/40317116/7092954
 */
export const taskTwo = async (client: Client): Promise<number | void> => {
    return client.query('SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY age_shooter1) \
                             FROM SchoolShoots \
                             WHERE age_shooter1 IS NOT NULL;')
                .then(result => (<Percentile[]> result.rows)[0].percentile_cont)
                .catch(console.error);
};
