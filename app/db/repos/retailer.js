// Lib Imports

// Local Imports
const sql = require('../sql/queries').retailer;


class RetailerRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // Add a new retailer
    add(args) {
        return this.db.one(sql.add, {
            retailerName: args.name
        });
    }

    // Update an existing retailer by id
    updateById(args) {
        return this.db.oneOrNone(sql.update, {
            retailerId: +args.id,
            retailerName: args.name
        });
    }

    // Get an existing retailer by id
    getById(id) {
        return this.db.oneOrNone('SELECT * FROM retailer WHERE id = $1', +id);
    }

    // Remove an existing retailer by id; return number of records deleted
    removeById(id) {
        return this.db.result('DELETE FROM retailer WHERE id = $1', +id, r => r.rowCount);
    }

    // Returns all retailers
    all() {
        return this.db.any('SELECT * FROM retailer');
    }

    // Returns the total number of retailers
    count() {
        return this.db.one('SELECT count(*) FROM retailer', [], r => +r.count);
    }
}

module.exports = RetailerRepository;