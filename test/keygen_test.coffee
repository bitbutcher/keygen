assert = require 'assert'

keygen = require '../bin'

assertKeyGen = (generator, base, factor, iterations=1000000) ->
  keys = {}
  console.log "Attempting to generate #{iterations} unique keys of length #{base * factor}.."
  for [1..iterations]
    key = generator(factor)
    assert.strictEqual base * factor, key.length
    assert not keys[key], "Duplicate: '#{key}'"
    keys[key] = true

describe 'keygen', ->

  describe '#hex(small)', ->

    it 'should generate unique ids of length 16', ->
      assertKeyGen keygen.hex, 16, keygen.small

  describe '#hex(medium)', ->

    it 'should generate unique ids of length 32', ->
      assertKeyGen keygen.hex, 16, keygen.medium

  describe '#hex(large)', ->

    it 'should generate unique ids of length 64', ->
      assertKeyGen keygen.hex, 16, keygen.large

  describe '#url(small)', ->

    it 'should generate unique ids of length 11', ->
      assertKeyGen keygen.url, 11, keygen.small

  describe '#url(medium)', ->

    it 'should generate unique ids of length 22', ->
      assertKeyGen keygen.url, 11, keygen.medium

  describe '#url(large)', ->

    it 'should generate unique ids of length 44', ->
      assertKeyGen keygen.url, 11, keygen.large
