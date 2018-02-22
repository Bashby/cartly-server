// Lib Imports
const promise = require('bluebird');

// Local Imports
const repos = require('./repos');


// Init pg-promise
const initOptions = {
    promiseLib: promise,
    extend(obj) {
        // Extending the database protocol with custom repositories
        obj.root = new repos.Root(obj, pgp);
        obj.retailer = new repos.Retailer(obj, pgp);
        obj.store = new repos.Store(obj, pgp);
        obj.item = new repos.Item(obj, pgp);
        obj.customer = new repos.Customer(obj, pgp);
        obj.requisition = new repos.Requisition(obj, pgp);
    }
};
const pgp = require('pg-promise')(initOptions);

// Connect to database
const connectionConfig = {
    host: 'postgres',
    port: 5432,
    database: 'bodego',
    user: 'postgres',
    password: 'bodegodb'
};
const db = pgp(connectionConfig);

module.exports = db;