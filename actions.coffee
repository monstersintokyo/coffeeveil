http = require 'http'
fs = require 'fs'
url = require 'url'

deliverDownload = (res, mapping, data) ->
  contentDisposition = if mapping.forceDownload then 'attachment' else 'inline'
  res.writeHead data.statusCode,
                'Content-Type': mapping.contentType
                'Content-Disposition': "#{contentDisposition}; filename=#{mapping.Filename};"
  data.pipe res # steaming the data instead of a complete load & send


actions =
  'download': (res, mapping) ->
    options = url.parse mapping.url
    switch options.protocol
      when 'http:'
        http.get(url.parse(mapping.url), (data) ->
          deliverDownload res, mapping, data)
      when 'file:'
        # stream file instead of reading whole file from disk into memory
        data = fs.createReadStream options.host + options.path
        data.statusCode = 200
        deliverDownload res, mapping, data
  'error': (res, mapping) ->
    res.send mapping.statusCode, mapping.statusCode + ' ' + mapping.data
  'redirect': (res, mapping) ->
    res.redirect (if mapping.type is 'permanent' then 301 else 307), mapping.url

module.exports = actions