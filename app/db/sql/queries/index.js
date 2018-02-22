// Lib Imports
const QueryFile = require('pg-promise').QueryFile;
const path = require('path');


// Helper for linking to external query files
function sql(file) {

    const fullPath = path.join(__dirname, file);

    const options = {
        minify: true,
        compress: true,
    };

    const qf = new QueryFile(fullPath, options);
    
    // Alert on any syntax or parsing errors in SQL query
    if (qf.error) {
        console.error(qf.error);
    }

    return qf;
}

module.exports = {
    retailer: {
        add: sql('retailer/add.sql'),
        update: sql('retailer/update.sql')
    },
    store: {
        add: sql('store/add.sql'),
        update: sql('store/update.sql')
    },
    item: {
        add: sql('item/add.sql'),
        update: sql('item/update.sql'),
        search: sql('item/search.sql')
    },
    customer: {
        add: sql('customer/add.sql'),
        update: sql('customer/update.sql')
    },
    requisition: {
        add: sql('requisition/add.sql'),
        update: sql('requisition/update.sql')
    },
    // search: {
    //     searchItem
    // }
};