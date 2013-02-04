should = require('chai').should()
moment = require 'moment'
verify = require('../constraints.js').verify

describe 'When verify is called with a mapping', ->
  describe 'without constraints', ->
    it 'should return the mapping', ->
      mapping = {foo: 'bar'}
      expected = mapping
      actual = verify mapping
      actual.should.be.eql(mapping)

  describe 'with a validBefore constraint', ->
    it 'should return the mapping if the given datetime is in the future', ->
      mapping =
        foo: 'bar'
        constraints: {
          validBefore: [moment(Date.UTC.apply({}, [2081, 1, 17, 23, 59, 59]))]
        }
      expected = mapping
      actual = verify mapping
      actual.should.be.eql(expected)
    it 'should return undefined if the datetime is in the past'

  describe 'with a validFrom constraint', ->
    it 'should return undefined if the given datetime is in the future'
    it 'should return the mapping f the given datetime is in the past'

  describe 'with more than one constraint', ->
    it 'should return the mapping if all the constraints are valid'
    it 'should return undefined if at least one constraint is not valid.'