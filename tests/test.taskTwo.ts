import { Client } from 'pg';
import { taskTwo } from '../src/tasks/taskTwo';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Eight', () => {
    test('Only test', () => {
        expect(taskTwo(client)).resolves
            .toEqual(16)
            .catch(console.error);
    });
});
