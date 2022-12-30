const path = require('path');

module.exports = {
    entry: path.resolve(__dirname, './index.js'),
    mode: 'development',
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/,
                use: ['babel-loader'],
            },
        ]
    },
    resolve: {
        extensions: ['*', '.js', '.jsx'],
    },
    output: {
        path: path.resolve(__dirname, './dist'),
        filename: 'bundle.js',
    },
    devServer: {
        static: path.resolve(__dirname, 'public'),
        devMiddleware: {
            index: true,
        },
        port: 3000
    },
    devtool: 'source-map'
}