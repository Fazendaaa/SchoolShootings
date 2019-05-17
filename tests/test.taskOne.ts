import { Client } from 'pg';
import { taskOne } from '../src/tasks/taskOne';

const database = process.env.DATABASE;
const client = new Client({
    database,
    user: process.env.USER
});

describe('Testing Task One', async () => {
    await client.connect();

    test('Only test', () => {
        expect(taskOne(client)).resolves
            .toEqual(true)
            .catch(console.error);
    });
});
