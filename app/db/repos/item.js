// Lib Imports

// Local Imports
const sql = require('../sql/queries').item;


class ItemRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // Add a new item
    add(args) {
        return this.db.one(sql.add, {
            itemName: args.name,
            itemDescription: args.description,
        });
    }

    // Update an existing item by id
    updateById(args) {
        return this.db.oneOrNone(sql.update, {
            itemId: +args.id,
            itemName: args.name,
            itemDescription: args.description,
        });
    }

    // Get an existing item by id
    getById(id) {
        return this.db.oneOrNone('SELECT * FROM item WHERE id = $1', +id);
    }

    // Remove an existing item by id; return number of records deleted
    removeById(id) {
        return this.db.result('DELETE FROM item WHERE id = $1', +id, r => r.rowCount);
    }

    // Returns all items
    all() {
        return this.db.any('SELECT * FROM item');
    }

    // Returns the total number of items
    count() {
        return this.db.one('SELECT count(*) FROM item', [], r => +r.count);
    }

    // Search for an item
    search(args) {
        console.log(args);
        return this.db.any(sql.search, {
            queryString: args
        });
    }
}

module.exports = ItemRepository;