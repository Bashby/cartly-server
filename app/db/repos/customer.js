// Lib Imports

// Local Imports
const sql = require('../sql/queries').customer;


class CustomerRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // Add a new customer
    add(args) {
        return this.db.one(sql.add, {
            customerName: args.name
        });
    }

    // Update an existing customer by id
    updateById(args) {
        return this.db.oneOrNone(sql.update, {
            customerId: +args.id,
            customerName: args.name
        });
    }

    // Get an existing customer by id
    getById(id) {
        return this.db.oneOrNone('SELECT * FROM customer WHERE id = $1', +id);
    }

    // Remove an existing customer by id; return number of records deleted
    removeById(id) {
        return this.db.result('DELETE FROM customer WHERE id = $1', +id, r => r.rowCount);
    }

    // Returns all customers
    all() {
        return this.db.any('SELECT * FROM customer');
    }

    // Returns the total number of customers
    count() {
        return this.db.one('SELECT count(*) FROM customer', [], r => +r.count);
    }
}

module.exports = CustomerRepository;