// Lib Imports
const Promise = require('bluebird');

// Local Imports


class RootRepository {
    constructor(db, pgp) {
        this.db = db;
        this.pgp = pgp;
    }

    // API Vocalize
    helloWorld() {
        return new Promise((resolve) => resolve("Hello, I am the bodego API!"));
    }
}

module.exports = RootRepository;