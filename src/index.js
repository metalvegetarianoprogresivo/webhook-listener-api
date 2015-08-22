var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
var sys = require('sys');
var exec = require('child_process').exec;
var child;

app.get('/', function (req, res) {
  res.send('Please use POST!');
});

app.post('/', function (req, res) {
  var cmd = "bash /opt/git-stuff/runner.sh " + req.body.repository.repo + " " + req.body.repository.url
  child = exec(cmd, function (error, stdout, stderr) {
    sys.print('stdout: ' + stdout);
    sys.print('stderr :' + stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  });
  res.send(req.body.repository.name + " deployed!");
});

var server = app.listen(5000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
