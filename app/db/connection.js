// Lib Imports
const Promise = require('bluebird');
const initOptions = {
    promiseLib: Promise
};
const pgp = require('pg-promise')(initOptions);


// Connect to DB
const connectionConfig = {

};
const db = pgp(connectionConfig);

module.exports = db;
