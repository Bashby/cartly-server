// Lib Imports

// Local Imports
const sql = require('../sql/queries').store;


class StoreRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // Add a new store
    add(args) {
        return this.db.one(sql.add, {
            storeName: args.name
        });
    }

    // Update an existing store by id
    updateById(args) {
        return this.db.oneOrNone(sql.update, {
            storeId: +args.id,
            storeName: args.name
        });
    }

    // Get an existing store by id
    getById(id) {
        return this.db.oneOrNone('SELECT * FROM store WHERE id = $1', +id);
    }

    // Remove an existing store by id; return number of records deleted
    removeById(id) {
        return this.db.result('DELETE FROM store WHERE id = $1', +id, r => r.rowCount);
    }

    // Returns all stores
    all() {
        return this.db.any('SELECT * FROM store');
    }

    // Returns the total number of stores
    count() {
        return this.db.one('SELECT count(*) FROM store', [], r => +r.count);
    }
}

module.exports = StoreRepository;