// Lib Imports
const Promise = require('bluebird');
const initOptions = {
    promiseLib: Promise
};
const pgp = require('pg-promise')(initOptions);


// Connect to DB
const connectionConfig = {
    host: 'postgres',
    port: 5432,
    database: 'cartly',
    user: 'postgres',
    password: 'cartlydb'
};
const db = pgp(connectionConfig);

module.exports = db;