import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskOneOne from '../../queries/taskOne.sql';

interface SumResult {
    readonly sum: number;
}

/**
 * Task One
 */
export const taskOne = async (client: Client): Promise<object> => {
    const blackShooters = await client.query('SELECT race_ethnicity_shooter1 FROM SchoolShoots \
                                                  WHERE race_ethnicity_shooter1\
                                                  IS NOT NULL AND \'b \' = race_ethnicity_shooter1;')
        .then(result => result.rows.length)
        .catch(console.error);
    const blackVictims = await client.query('SELECT SUM(black) FROM \
                                                 (SELECT CAST(black AS INT) \
                                                     FROM SchoolShoots) as SubQuery;')
        .then(result => (<SumResult[]> result.rows)[0].sum)
        .catch(console.error);

    return {
        blackVictims,
        blackShooters
    };
};
