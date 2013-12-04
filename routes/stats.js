var os = require('os'),
    util = require('util');

module.exports = function (req, res) {
  "use strict";

  (function run() {

    var avg = os.loadavg(),
        total = os.totalmem(),
        free = os.freemem();

    res.write(util.format('load: %d %d %d, total mem: %d, free: %d\n',
                          avg[0], avg[1], avg[2], os.totalmem(), os.freemem()));

    setTimeout(run, 1000);

  })();
};
