import { Client } from 'pg';
// tslint:disable-next-line: match-default-export-name
// import taskFourSQL from '../../queries/taskFour.sql';

/**
 * Task Four
 */
export const taskFour = async (client: Client): Promise<object> => {
    await client.query('SELECT SchoolShoots.state, USStates.State, USStates.StateName FROM \
                            SchoolShoots LEFT JOIN USStates ON \
                            (SchoolShoots.state = USStates.StateName) LIMIT 20;')
        .catch(console.error);

    await client.query('SELECT SchoolShoots.state, USStates.State, USStates.StateName FROM \
                            SchoolShoots JOIN USStates ON \
                            (TRIM(\' \' FROM SchoolShoots.state) = USStates.StateName) LIMIT 20;')
        .catch(console.error);

    await client.query('ALTER TABLE SchoolShoots ADD SttNam TEXT;')
        .catch(console.error);

    const updateTable = await client.query('UPDATE SchoolShoots SET\
                                          SttNam = tableAux.Stn FROM\
                                          (SELECT USStates.State as Stn, USStates.StateName FROM \
                                          SchoolShoots JOIN USStates ON \
                                          (TRIM(\' \' FROM SchoolShoots.state) = USStates.StateName)) AS tableAux\
                                          WHERE (TRIM(\' \' FROM SchoolShoots.state) = tableAux.StateName);')
        .then(result => result)
        .catch(console.error);

    console.log(updateTable);

    return {
        updateTable
    };
};
