###
  Silkveil in CoffeeScript by MonstersInTokyo
###
"use strict";

http = require 'http'
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

