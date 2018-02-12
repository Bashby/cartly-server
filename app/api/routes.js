// Lib Imports
const express = require('express');

// Local Imports


// Configure router
var router = express.Router();

// Configure routes
router.get('/api/puppies', db.getAllPuppies);
router.get('/api/puppies/:id', db.getSinglePuppy);
router.post('/api/puppies', db.createPuppy);
router.put('/api/puppies/:id', db.updatePuppy);
router.delete('/api/puppies/:id', db.removePuppy);

module.exports = router;
