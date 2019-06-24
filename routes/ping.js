var router = require('express').Router();
var TYPES = require('tedious').TYPES;

/* GET task listing. */
router.get('/', function (req, res) {
    res.send('pong!');
});

module.exports = router;