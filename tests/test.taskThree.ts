import { Client } from 'pg';
import { taskThree } from '../src/tasks/taskThree';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task Eight', () => {
    test('Only test', () => {
        expect(taskThree)
            .toEqual('taskThree');
    });
});
