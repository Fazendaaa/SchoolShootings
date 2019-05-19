import { Client } from 'pg';
import { taskEight } from '../src/tasks/taskEight';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Eight', () => {
    test('Only test', () => {
        expect(taskEight)
            .toEqual('taskEight');
    });
});
