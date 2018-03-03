// Lib Imports
const express = require('express')
const morgan = require('morgan')
const winston = require('winston')
const bodyParser = require('body-parser')
const cors = require('cors')
const path = require('path')
const serveStatic = require('serve-static')
const cookieParser = require('cookie-parser')

// Local Imports
const api = require('./api');


const LOG_LEVEL = process.env.LOG_LEVEL || 'debug';

const logger = new winston.Logger({
    transports: [
        new winston.transports.Console({
            level: LOG_LEVEL,
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

// parse cookies
app.use(cookieParser())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())

// setup CORS with pre-flight
var corsOptions = {
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204 
}
app.use(cors(corsOptions))
app.options('*', cors(corsOptions))

///////////////////
// Static Assets //
///////////////////

app.use('/static', serveStatic(path.join(__dirname, 'public')));

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

app.listen(app.get("port"), () => logger.info('bodego server started. Listening on port ' + app.get("port") + '.'))
