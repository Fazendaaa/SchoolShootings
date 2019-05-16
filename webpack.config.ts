import { resolve } from 'path';
import { IgnorePlugin } from 'webpack';

module.exports = {
    target: 'node',
    mode: 'development',
    entry: './src/index.ts',
    plugins: [
        new IgnorePlugin(/^pg-native$/)
    ],
    output: {
        filename: 'index.js',
        path: resolve(__dirname, 'dist')
    },
    resolve: {
        extensions: [
            '.tsx',
            '.ts',
            '.js'
        ]
    },
    module: {
        rules: [
            {
                test: /\.mjs$/,
                include: /node_modules/,
                type: 'javascript/auto'
            },
            {
                test: /\.sql$/i,
                use: 'raw-loader'
            },
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/
            }
        ]
    }
};
