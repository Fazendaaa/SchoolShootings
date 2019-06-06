import { Client } from 'pg';
import { taskSix } from '../src/tasks/taskSix';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Six', () => {
    test('Only test', () => {
        expect(taskSix(client)).resolves
            .toEqual({})
            .catch(console.error);
    });
});
