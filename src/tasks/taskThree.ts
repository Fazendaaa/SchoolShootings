import { Client, QueryResult } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskThreeSQL from '../../queries/taskThree.sql';

/**
 * Task One
 */
export const taskThree = async (client: Client): Promise<void | QueryResult | object> => {
    await client.query('SELECT USCensus.*, USStates.StateName, USStates.CensusRegion, USStates.CensusRegionName, USStates.CensusDivision, USStates.CensusDivisionName, USStates.HouseSeats FROM \
                            USCensus JOIN USStates ON \
                            (USCensus.City = USStates.Capital) AND (USCensus.STATE = USStates.STATE) LIMIT 20;')
        .then(result => result.rows.length)
        .catch(console.error);

    await client.query('ALTER TABLE USStates ALTER COLUMN State TYPE TEXT;')
        // .then(result => (<SumResult[]> result.rows)[0].sum)
        .catch(console.error);

    return {};
};
