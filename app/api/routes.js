// Lib Imports
const validator = require('validator');

// Local Improts
var db = require('../db');
const wrapper = require('./wrapper');

// Root
wrapper.get('/', () => db.root.helloWorld());

// Retailer
wrapper.get('/retailers', () => db.retailer.all());
wrapper.get('/retailers/count', () => db.retailer.count());
wrapper.get('/retailer', () => db.retailer.all());
wrapper.post('/retailer', (req) => db.retailer.add(req.body));
wrapper.get('/retailer/:id', (req) => db.retailer.getById(req.params.id));
wrapper.put('/retailer/:id', (req) => {
    return db.task('retailer-add/update', t => {
        return t.retailer.getById(req.params.id)
            .then(retailer => {
                if (retailer) {
                    // Update pre-existing
                    return t.retailer.updateById(req.params)
                } else if (validator.isNumeric(req.params.id)) {
                    // Add new
                    return t.retailer.add(req.params.id);
                } else {
                    throw("Invalid ID.");
                }
            });
    });
});
wrapper.delete('/retailer/:id', (req) => db.retailer.removeById(req.params.id));

// Store
wrapper.get('/stores', () => db.store.all());
wrapper.get('/stores/count', () => db.store.count());
wrapper.get('/store', () => db.store.all());
wrapper.post('/store', (req) => db.store.add(req.params.name));
wrapper.get('/store/:id', (req) => db.store.getById(req.params.id));
wrapper.put('/store/:id', (req) => {
    return db.task('store-add/update', t => {
        return t.store.getById(req.params.id)
            .then(store => {
                if (store) {
                    // Update pre-existing
                    return t.store.updateById(req.params)
                } else if (validator.isNumeric(req.params.id)) {
                    // Add new
                    return t.store.add(req.params.id);
                } else {
                    throw("Invalid ID.");
                }
            });
    });
});
wrapper.delete('/store/:id', (req) => db.store.removeById(req.params.id));

// Item
wrapper.get('/items', () => db.item.all());
wrapper.get('/items/count', () => db.item.count());
wrapper.get('/item', () => db.item.all());
wrapper.post('/item', (req) => db.item.add(req.body));
wrapper.get('/item/:id', (req) => db.item.getById(req.params.id));
wrapper.put('/item/:id', (req) => {
    return db.task('item-add/update', t => {
        return t.item.getById(req.params.id)
            .then(item => {
                if (item) {
                    // Update pre-existing
                    return t.item.updateById(req.params.id, ...req.body)
                } else if (validator.isNumeric(req.params.id)) {
                    // Add new
                    return t.item.add(req.params.id, ...req.body);
                } else {
                    throw("Invalid ID.");
                }
            });
    });
});
wrapper.delete('/item/:id', (req) => db.item.removeById(req.params.id));
wrapper.get('/search/item/:query', (req) => db.item.search(req.params.query));


// Customer
wrapper.get('/customers', () => db.customer.all());
wrapper.get('/customers/count', () => db.customer.count());
wrapper.get('/customer', () => db.customer.all());
wrapper.post('/customer', (req) => db.customer.add(req.params.name));
wrapper.get('/customer/:id', (req) => db.customer.getById(req.params.id));
wrapper.put('/customer/:id', (req) => {
    return db.task('customer-add/update', t => {
        return t.customer.getById(req.params.id)
            .then(customer => {
                if (customer) {
                    // Update pre-existing
                    return t.customer.updateById(req.params)
                } else if (validator.isNumeric(req.params.id)) {
                    // Add new
                    return t.customer.add(req.params.id);
                } else {
                    throw("Invalid ID.");
                }
            });
    });
});
wrapper.delete('/customer/:id', (req) => db.customer.removeById(req.params.id));

// Order (requisition)
wrapper.get('/orders', () => db.requisition.all());
wrapper.get('/orders/count', () => db.requisition.count());
wrapper.get('/order', () => db.requisition.all());
wrapper.post('/order', (req) => db.requisition.add(req.params.name));
wrapper.get('/order/:id', (req) => db.requisition.getById(req.params.id));
wrapper.put('/order/:id', (req) => {
    return db.task('requisition-add/update', t => {
        return t.requisition.getById(req.params.id)
            .then(requisition => {
                if (requisition) {
                    // Update pre-existing
                    return t.requisition.updateById(req.params)
                } else if (validator.isNumeric(req.params.id)) {
                    // Add new
                    return t.requisition.add(req.params.id);
                } else {
                    throw("Invalid ID.");
                }
            });
    });
});
wrapper.delete('/order/:id', (req) => db.requisition.removeById(req.params.id));

// Search
// wrapper.get('/search', db.search);

module.exports = wrapper.router;