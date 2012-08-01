assert = require 'assert'

matrix = require '../bin/matrix'

rows = [
  [ 'a', 'b', 'c' ]
  [ '1', '2', '3' ]
  [ 'A', 'B', 'C' ]
]

describe 'matrix', ->

  describe '#column(index, rows...)', ->

    it 'should return [] when no rows are given', ->
      assert.deepEqual [], matrix.column(0)

    it "should return [ 'a' ] when called with 0, [ 'a', 'b', 'c' ]", ->
      assert.deepEqual [ 'a' ], matrix.column(0, rows[0])

    it "should return [ 'a', '1', 'A' ] when called with 0, [ 'a', 'b', 'c' ], [ '1', '2', '3' ], [ 'A', 'B', 'C' ]", ->
      assert.deepEqual [ 'a', '1', 'A' ], matrix.column(0, rows...)

    it "should return [ 'b', '2', 'B' ] when called with 1, [ 'a', 'b', 'c' ], [ '1', '2', '3' ], [ 'A', 'B', 'C' ]", ->
      assert.deepEqual [ 'b', '2', 'B' ], matrix.column(1, rows...)

    it "should return [ 'c', '3', 'C' ] when called with 2, [ 'a', 'b', 'c' ], [ '1', '2', '3' ], [ 'A', 'B', 'C' ]", ->
      assert.deepEqual [ 'c', '3', 'C' ], matrix.column(2, rows...)

    it "should return [] when called with 3, [ 'a', 'b', 'c' ], [ '1', '2', '3' ], [ 'A', 'B', 'C' ]", ->
      assert.deepEqual [], matrix.column(3, rows...)

  describe '#columns(rows...)', ->

    it 'should return [] when no rows are given', ->
      assert.deepEqual [], matrix.columns(0)

    it "should return [ [ 'a' ], ['b'], ['c'] ] when called with [ 'a', 'b', 'c' ]", ->
      assert.deepEqual [ [ 'a' ], ['b'], ['c'] ], matrix.columns(rows[0])

    it "should return [ [ 'a', '1', 'A' ], [ 'b', '2', 'B' ], [ 'c', '3', 'C' ] ] when called with [ 'a', 'b', 'c' ], [ '1', '2', '3' ], [ 'A', 'B', 'C' ]", ->
      assert.deepEqual [ [ 'a', '1', 'A' ], [ 'b', '2', 'B' ], [ 'c', '3', 'C' ] ], matrix.columns(rows...)

    it "should be it's own inverse", ->
      assert.deepEqual rows, matrix.columns(matrix.columns(rows...)...)
