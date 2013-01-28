###
  Silkveil in CoffeeScript by Christian Weber

###

"use strict";

http = require('http')
mappings =
  'chris':
    action: 'redirect'
    url: 'http://www.sp-studios.com'
    type: 'permanent'
  'polarbear':
    action: 'download'
    url: 'http://www.goloroden.de/images/Logo.png'
    filename: 'PolarBear.png'
    contentType: 'image/png'
    forceDownload: false

actions =
  'download': (res, mapping) ->
  'error': (res, mapping) ->
    res.writeHead mapping.statusCode, {'Content-Type': 'text/html'}
    res.end mapping.statusCode + ' ' + mapping.data
  'redirect': (res, mapping) ->
    statusCode = if mapping.type is 'permanent' then 301 else 307
    res.writeHead statusCode,
      'Location': mapping.url
    res.end()



http.createServer (req, res) ->
  alias = req.url.substring 1
  mapping = mappings[alias] or
    action: 'error',
    statusCode: 404,
    data: 'file not found'
  actions[mapping.action](res, mapping)
.listen 4000

