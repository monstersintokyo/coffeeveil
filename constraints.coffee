moment = require 'moment'

constraints =
  'validBefore': (datetime) ->
    now = moment()
    now.diff(datetime) <= 0
  'validFrom': (datetime) ->
    now = moment()
    now.diff(datetime) >= 0

verify = (mapping) ->
  if not mapping.constraints
    return mapping
  for constraint of mapping.constraints
    if not mapping.constraints.hasOwnProperty constraint
      continue
    if constraints[constraint].apply({}, mapping.constraints[constraint]) is false
      return undefined
  return mapping

module.exports.verify = verify
