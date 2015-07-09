assert = require 'assert'

crypto = require 'crypto'

keygen = require '../src'

assertKeyGen = (generator, length, iterations=1000000) ->
  keys = {}
  console.log "Attempting to generate #{iterations} unique keys of length #{length}.."
  for [1..iterations]
    key = generator(length)
    assert.strictEqual length, key.length
    assert not keys[key], "Duplicate: '#{key}'"
    keys[key] = true

describe 'keygen', ->

  describe 'on random source failure', ->

    before ->
      @random = crypto.randomBytes
      crypto.randomBytes = ->
        throw 'boom!'

    after ->
      crypto.randomBytes = @random

    it 'should fall back to Math.random', ->
      key = keygen.hex()
      assert.strictEqual 22, key.length


  describe '#hex()', ->
    key = keygen.hex()
    assert.strictEqual 22, key.length

  describe '#hex(small)', ->

    it 'should generate unique ids of length 16', ->
      assertKeyGen keygen.hex, keygen.small

  describe '#hex(medium)', ->

    it 'should generate unique ids of length 32', ->
      assertKeyGen keygen.hex, keygen.medium

  describe '#hex(large)', ->

    it 'should generate unique ids of length 64', ->
      assertKeyGen keygen.hex, keygen.large

  describe '#url()', ->
    key = keygen.url()
    assert.strictEqual 22, key.length

  describe '#url(small)', ->

    it 'should generate unique ids of length 11', ->
      assertKeyGen keygen.url, keygen.small

  describe '#url(medium)', ->

    it 'should generate unique ids of length 22', ->
      assertKeyGen keygen.url, keygen.medium

  describe '#url(large)', ->

    it 'should generate unique ids of length 44', ->
      assertKeyGen keygen.url, keygen.large
