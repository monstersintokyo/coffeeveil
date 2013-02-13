url = require 'url'

redirect = (domain) ->
  (req, res) ->
    hostHeader = req.headers.host || ''
    if hostHeader.indexOf('localhost') is 0 or hostHeader.indexOf(domain) is 0
      return
    options = url.parse req.url
    options.host = domain
    res.writeHead 301,
                  'Location': url.format options
    res.end()

module.exports.redirect = redirect
