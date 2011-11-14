(function() {
  var exec, http, ole_path, path, server, vlc_path;
  http = require('http');
  exec = require('child_process').exec;
  path = require('path');
  server = http.createServer(function(request, response) {
    exec("" + (vlc_path()) + " -I dummy --play-and-exit " + (ole_path()), function(error, stdout, stderr) {
      if (stderr !== null) {
        console.log("VLC said:\n\n " + stderr);
      }
      if (error !== null) {
        return console.log(error);
      }
    });
    response.writeHead(200, {
      'Content-Type': 'text/plain'
    });
    return response.end("Ole'd!");
  });
  server.listen(9494);
  console.log("Ole server listening on port 9494!");
  ole_path = function() {
    return path.join(process.cwd(), 'assets', 'ole_trumpet.mp3');
  };
  vlc_path = function() {
    var vlc;
    if (require('os').type().match(/darwin/)) {
      vlc = {
        "/Applications/VLC.app/Contents/Mac OS/VLC": "vlc"
      };
    } else {
      vlc = "vlc";
    }
    return vlc;
  };
}).call(this);
