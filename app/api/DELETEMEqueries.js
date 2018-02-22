// Lib Imports

// Local Imports
const db = require('./connection');


/////////////////////
// Query Functions
/////////////////////

// getAllRetailers
function getAllRetailers(req, res, next) {
    db.any('SELECT * FROM retailer')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved all retailers'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// createRetailer
function createRetailer(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getRetailerById
function getRetailerById(req, res, next) {
    let id = parseInt(req.params.id);
    db.one('SELECT * FROM retailer WHERE id = $1', id)
    .then(function (data) {
        res.status(200)
        .json({
            status: 'success',
            data: data,
            message: 'Retrieved one retailer'
        });
    })
    .catch(function (err) {
        return next(err);
    });
}

// createOrUpdateRetailerById
function createOrUpdateRetailerById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// deleteRetailerById
function deleteRetailerById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getAllStores
function getAllStores(req, res, next) {
    db.any('SELECT * FROM store')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved all stores'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// createStore
function createStore(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getStoreById
function getStoreById(req, res, next) {
    let id = parseInt(req.params.id);
    db.one('SELECT * FROM store WHERE id = $1', id)
    .then(function (data) {
        res.status(200)
        .json({
            status: 'success',
            data: data,
            message: 'Retrieved one store'
        });
    })
    .catch(function (err) {
        return next(err);
    });
}

// createOrUpdateStoreById
function createOrUpdateStoreById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// deleteStoreById
function deleteStoreById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getAllItems
function getAllItems(req, res, next) {
    db.any('SELECT * FROM item')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved all items'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// createItem
function createItem(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getItemById
function getItemById(req, res, next) {
    let id = parseInt(req.params.id);
    db.one('SELECT * FROM item WHERE id = $1', id)
    .then(function (data) {
        res.status(200)
        .json({
            status: 'success',
            data: data,
            message: 'Retrieved one item'
        });
    })
    .catch(function (err) {
        return next(err);
    });
}

// createOrUpdateItemById
function createOrUpdateItemById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// deleteItemById
function deleteItemById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getAllOrders
function getAllOrders(req, res, next) {
    db.any('SELECT * FROM "order"')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved all orders'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// createOrder
function createOrder(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getOrderById
function getOrderById(req, res, next) {
    let id = parseInt(req.params.id);
    db.one('SELECT * FROM order WHERE id = $1', id)
    .then(function (data) {
        res.status(200)
        .json({
            status: 'success',
            data: data,
            message: 'Retrieved one order'
        });
    })
    .catch(function (err) {
        return next(err);
    });
}

// createOrUpdateOrderById
function createOrUpdateOrderById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// deleteOrderById
function deleteOrderById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getAllCustomers
function getAllCustomers(req, res, next) {
    db.any('SELECT * FROM customer')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved all customers'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

// createCustomer
function createCustomer(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// getCustomerById
function getCustomerById(req, res, next) {
    let id = parseInt(req.params.id);
    db.one('SELECT * FROM customer WHERE id = $1', id)
    .then(function (data) {
        res.status(200)
        .json({
            status: 'success',
            data: data,
            message: 'Retrieved one customer'
        });
    })
    .catch(function (err) {
        return next(err);
    });
}

// createOrUpdateCustomerById
function createOrUpdateCustomerById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// deleteCustomerById
function deleteCustomerById(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

// search
function search(req, res, next) {
    res.status(501)
    .json({
        status: 'failure',
        data: null,
        message: 'Not implemented'
    });
}

/////////////
// Exports //
/////////////

module.exports = {
    getAllRetailers: getAllRetailers,
    createRetailer: createRetailer,
    getRetailerById: getRetailerById,
    createOrUpdateRetailerById: createOrUpdateRetailerById,
    deleteRetailerById: deleteRetailerById,
    getAllStores: getAllStores,
    createStore: createStore,
    getStoreById: getStoreById,
    createOrUpdateStoreById: createOrUpdateStoreById,
    deleteStoreById: deleteStoreById,
    getAllItems: getAllItems,
    createItem: createItem,
    getItemById: getItemById,
    createOrUpdateItemById: createOrUpdateItemById,
    deleteItemById: deleteItemById,
    getAllOrders: getAllOrders,
    createOrder: createOrder,
    getOrderById: getOrderById,
    createOrUpdateOrderById: createOrUpdateOrderById,
    deleteOrderById: deleteOrderById,
    getAllCustomers: getAllCustomers,
    createCustomer: createCustomer,
    getCustomerById: getCustomerById,
    createOrUpdateCustomerById: createOrUpdateCustomerById,
    deleteCustomerById: deleteCustomerById,
    search: search
};