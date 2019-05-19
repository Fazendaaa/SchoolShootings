import { Client } from 'pg';
import { taskFive } from '../src/tasks/taskFive';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Eight', () => {
    test('Only test', () => {
        expect(taskFive)
            .toEqual('taskFive');
    });
});
