###
  Silkveil in CoffeeScript by MonstersInTokyo
###

http = require 'http'
express = require 'express'
redirect = require('./redirect.coffee').redirect 'sp-studios.com'

actions = require './actions.coffee'
mappings = require './mappings.coffee'
constraints = require './constraints.coffee'

app = express()
app.configure ->
  app.use redirect

app.get '/:alias', (req, res) ->
  mapping = mappings[req.params.alias] or
    action: 'error',
    statusCode: 404,
    data: 'file not found'
  mapping = constraints.verify(mapping) or
    action: 'error',
    statusCode: 409,
    data: 'Conflict'
  actions[mapping.action](res, mapping)
http.createServer(app).listen process.env.PORT or 3000

