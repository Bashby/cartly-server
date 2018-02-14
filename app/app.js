// Lib Imports
const express = require('express')
const morgan = require('morgan')
const winston = require('winston')
const bodyParser = require('body-parser')
const cors = require('cors')

// Local Imports
const api = require('./api');

const level = process.env.LOG_LEVEL || 'debug';

const logger = new winston.Logger({
    transports: [
        new winston.transports.Console({
            level: level,
            timestamp: function () {
                return (new Date()).toISOString();
            }
        })
    ]
});

let app = express()
app.disable('x-powered-by');

////////////////
// Middleware //
////////////////

// log requests and responses, splitting stream on error code
app.use(morgan(app.get("env") === "production" ? "combined" : "dev", {
    skip: function (req, res) {
        return res.statusCode < 400
    }, stream: process.stderr
}));
app.use(morgan(app.get("env") === "production" ? "combined" : "dev", {
    skip: function (req, res) {
        return res.statusCode >= 400
    }, stream: process.stdout
}));

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// setup CORS with pre-flight
var corsOptions = {
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204 
}
app.use(cors(corsOptions))
app.options('*', cors(corsOptions))

/////////////////
// API Queries //
/////////////////

app.use('/api', api);

//////////////////
// Server setup //
//////////////////

app.set("env", process.env.NODE_ENV || "development");
app.set("host", process.env.HOST || "0.0.0.0");
app.set("port", process.env.PORT || 8080);

app.listen(app.get("port"), () => logger.info('Cartly Server started. Listening on port ' + app.get("port") + '.'))
