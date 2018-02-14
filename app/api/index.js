// Lib Imports
const express = require('express');
const router = express.Router();

// Local imports
var db = require('../db');


// API Root Response
router.get('/', function(req, res, next) {
    res.status(200)
      .json({
        status: 'success',
        message: 'Hi, I am the Cartly API!'
      });
});

////////////////////////
// Persistence Routes //
////////////////////////

// Retailer
router.get('/retailer', db.getAllRetailers);
router.post('/retailer', db.createRetailer);
router.get('/retailer/:id', db.getRetailerById);
router.put('/retailer/:id', db.createOrUpdateRetailerById);
router.delete('/retailer/:id', db.deleteRetailerById);

// Store
router.get('/store', db.getAllStores);
router.post('/store', db.createStore);
router.get('/store/:id', db.getStoreById);
router.put('/store/:id', db.createOrUpdateStoreById);
router.delete('/store/:id', db.deleteStoreById);

// Item
router.get('/item', db.getAllItems);
router.post('/item', db.createItem);
router.get('/item/:id', db.getItemById);
router.put('/item/:id', db.createOrUpdateItemById);
router.delete('/item/:id', db.deleteItemById);

// Order
router.get('/order', db.getAllOrders);
router.post('/order', db.createOrder);
router.get('/order/:id', db.getOrderById);
router.put('/order/:id', db.createOrUpdateOrderById);
router.delete('/order/:id', db.deleteOrderById);

// Customer
router.get('/customer', db.getAllCustomers);
router.post('/customer', db.createCustomer);
router.get('/customer/:id', db.getCustomerById);
router.put('/customer/:id', db.createOrUpdateCustomerById);
router.delete('/customer/:id', db.deleteCustomerById);

// Search
router.get('/search', db.search);

module.exports = router;