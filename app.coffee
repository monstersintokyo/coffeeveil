###
  Silkveil in CoffeeScript by MonstersInTokyo
###

http = require 'http'
redirect = require('./redirect').redirect 'sp-studios.com'

actions = require './actions.coffee'
mappings = require './mappings.coffee'
constraints = require './constraints.coffee'


http.createServer (req, res) ->
  alias = req.url.substring 1
  mapping = mappings[alias] or
    action: 'error',
    statusCode: 404,
    data: 'file not found'
  mapping = constraints.verify(mapping) or
    action: 'error',
    statusCode: 409,
    data: 'Conflict'
  actions[mapping.action](res, mapping)
.listen process.env.PORT or 3000

