// Lib Imports

// Local Imports
const sql = require('../sql/queries').requisition;


class RequisitionRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // Add a new requisition
    add(args) {
        return this.db.one(sql.add, {
            requisitionName: args.name
        });
    }

    // Update an existing requisition by id
    updateById(args) {
        return this.db.oneOrNone(sql.update, {
            requisitionId: +args.id,
            requisitionName: args.name
        });
    }

    // Get an existing requisition by id
    getById(id) {
        return this.db.oneOrNone('SELECT * FROM requisition WHERE id = $1', +id);
    }

    // Remove an existing requisition by id; return number of records deleted
    removeById(id) {
        return this.db.result('DELETE FROM requisition WHERE id = $1', +id, r => r.rowCount);
    }

    // Returns all requisitions
    all() {
        return this.db.any('SELECT * FROM requisition');
    }

    // Returns the total number of requisitions
    count() {
        return this.db.one('SELECT count(*) FROM requisition', [], r => +r.count);
    }
}

module.exports = RequisitionRepository;