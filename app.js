var express = require('express');
var config = require('config');
var bodyParser = require('body-parser');
var tediousExpress = require('express4-tedious');

var config = {
    server: process.env.MSSQL_HOST,
    userName: process.env.MSSQL_USER,
    password: process.env.MSSQL_PASS,
    options: { 
       database: process.env.MSSQL_DB || 'TodoDb',
       port: parseInt(process.env.MSSQL_PORT) || 1433,
    }
}

var app = express();
app.use(function (req, res, next) {
    req.sql = tediousExpress(config);
    next();
});

app.use(bodyParser.text()); 
app.use('/todo', require('./routes/todo'));
app.use('/ping', require('./routes/ping'));

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found: '+ req.method + ":" + req.originalUrl);
    err.status = 404;
    next(err);
});
app.set('port', process.env.PORT || 3000);

var server = app.listen(app.get('port'), function() {
    console.log('Express server listening on port ' + server.address().port);
});

module.exports = app;
