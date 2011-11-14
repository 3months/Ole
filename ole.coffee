http = require('http')
exec = require('child_process').exec
path = require('path')

server = http.createServer (request, response) ->
  exec("#{vlc_path()} -I dummy --play-and-exit #{ole_path()}", (error, stdout, stderr) ->
  
    # Output information from VLC about what we are playing, and 
    # any errors encountered (That aren't a node error)
    console.log "VLC said:\n\n #{stderr}" if stderr != null
    
    # Output node errors
    console.log error if error != null
    
    # Write a message back to the browser with status 201 Created
    # (Hey, we Ole'd, didn't we!?)
    response.writeHead 201, {'Content-Type': 'text/plain'}
    response.end "Ole'd!"
  )
  
server.listen(9494)
console.log "Ole server listening on port 9494!"

# Helper methods

ole_path = ->
  path.join(process.cwd(), 'assets', 'ole_trumpet.mp3')


vlc_path = ->
  if require('os').type().match(/darwin/)
    vlc = "/Applications/VLC.app/Contents/Mac OS/VLC" : "vlc"
  else
    vlc = "vlc"
  vlc
 
