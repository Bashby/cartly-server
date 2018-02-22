// Lib Imports
const express = require('express');
const router = express.Router();

// Local imports


// Generic handlers
function GET(url, handler) {
    router.get(url, (req, res) => {
        handler(req)
            .then(data => {
                res.status(200).json({
                    success: true,
                    data: data
                });
            })
            .catch(error => {
                res.status(500).json({
                    success: false,
                    error: error.message || error
                });
            });
    });
}

function POST(url, handler) {
    router.post(url, (req, res) => {
        handler(req)
            .then(data => {
                res.status(200).json({
                    success: true,
                    data: data
                });
            })
            .catch(error => {
                res.status(500).json({
                    success: false,
                    error: error.message || error
                });
            });
    });
}

function PUT(url, handler) {
    router.put(url, (req, res) => {
        handler(req)
            .then(data => {
                res.status(200).json({
                    success: true,
                    data: data
                });
            })
            .catch(error => {
                res.status(500).json({
                    success: false,
                    error: error.message || error
                });
            });
    });
}

function DELETE(url, handler) {
    router.delete(url, (req, res) => {
        handler(req)
            .then(data => {
                res.status(200).json({
                    success: true,
                    data: data
                });
            })
            .catch(error => {
                res.status(500).json({
                    success: false,
                    error: error.message || error
                });
            });
    });
}

module.exports = {
    router: router,
    get: GET,
    post: POST,
    put: PUT,
    delete: DELETE
}