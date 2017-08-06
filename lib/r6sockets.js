'use strict';
var r6socket = {},
controllers = require('./controllers')

r6socket.updateStats = function(socket, data, callback){
  controllers.updateStatsSocket(function(err,result){
    // console.log(result)
    callback(null, result)
  })
}

module.exports = r6socket;
