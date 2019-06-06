import { Client } from 'pg';
import { taskFour } from '../src/tasks/taskFour';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Four', () => {
    test('Only test', () => {
        expect(taskFour(client)).resolves
            .toEqual({})
            .catch(console.error);
    });
});
