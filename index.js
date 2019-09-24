var http = require('http')
var spawn = require('child_process').spawn
var createHandler = require('github-webhook-handler')
var handler
function getHandler(path) {
    return createHandler({
        path: path,
        secret: '1h2z3z2325076'
    })
}
http.createServer(function (req, res) {
    // console.log(req.url)
    if (/^\/pushCode/.test(req.url)) {
      handler = getHandler(req.url)

      handler((req, res, function (err) {
        res.statusCode = 404;
        res.end('no such location')
      }))
    } else {
        res.statusCode = 404;
        res.end('no such location')
    }
}).listen(8900)

handler.on('error', function (err) {
    console.error('Error:', err.message)
  })
  
handler.on('push', function (event) {
    console.log('Received a push event for %s to %s',
      event.payload.repository.name,
      event.payload.ref)
    rumCommand('sh', ['./deployed.sh', event.payload.repository.name], function (txt) {
      console.log(txt)
    })
})

function rumCommand(cmd, args, callback) {
  var child = spawn(cmd, args)
  var response = ''
  child.stdout.on('data', function (buffer) {
    response += buffer.toString()
  })
  child.stdout.on('end', function () {
    callback(response)
  })
}
