"use strict";

var http = require('http'),
    stats = require('./routes/stats'),
    express = require('express'),

    app = express();

app.get('/stats', stats);

http.createServer(app).listen(3000, function () {
  console.log('PI stats server listening on port 3000');
});
