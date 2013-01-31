###
  Silkveil in CoffeeScript by MonstersInTokyo
###

http = require 'http'
redirect = require('redirect').redirect 'sp-studios.com'
actions = require './actions.js'
mappings = require './mappings.js'


http.createServer (req, res) ->
  alias = req.url.substring 1
  mapping = mappings[alias] or
    action: 'error',
    statusCode: 404,
    data: 'file not found'
  actions[mapping.action](res, mapping)
.listen 3000

