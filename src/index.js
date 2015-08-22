var express = require('express');
var app = express();

var sys = require('sys');
var exec = require('child_process').exec;
var child;

app.get('/', function (req, res) {
  res.send('Please use POST!');
});

app.post('/', function (req, res) {
  child = exec("bash ~/runner.sh", function (error, stdout, stderr) {
    sys.print('stdout: ' + stdout);
    sys.print('stderr :' + stderr);
    if (errpr !== null) {
      console.log('exec error: ' + error);
    }
  });
  res.send('Ok');
});

var server = app.listen(5000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
