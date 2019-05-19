import { Client } from 'pg';
import { taskOne } from '../src/tasks/taskOne';

const client = new Client({
    user: process.env.USER,
    database: process.env.DATABASE
});

beforeAll(async () => {
    await client.connect();
})

describe('Testing Task One', () => {
    test('Only test', () => {
        expect(taskOne(client)).resolves
            .toEqual({
                blackShooters: 40,
                blackVictims: '84694'
            })
            .catch(console.error);
    });
});
