import { Client } from 'pg';
import { taskSeven } from '../src/tasks/taskSeven';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Eight', () => {
    test('Only test', () => {
        expect(taskSeven)
            .toEqual('taskSeven');
    });
});
