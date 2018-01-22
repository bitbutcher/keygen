###
 * keygen
 * https://github.com/bitbutcher/keygen
 *
 * Copyright (c) 2015 Sean M. Duncan
 * Licensed under the MIT license.
###

crypto = require 'crypto'

small = 11
medium = small * 2
large = medium * 2

gen_for = (alpha) ->
  alpha = (alpha for it in [0..256 / alpha.length + 1]).join('').split('')
  generate = (bytes) ->
    key = ''
    key += alpha[byte] for byte in bytes
    key
  sync = (length) ->
    try
      generate crypto.randomBytes length
    catch ex
      generate crypto.pseudoRandomBytes length
  async = (length, callback) ->
    crypto.randomBytes length, (err, bytes) ->
      return callback generate bytes unless err?
      crypto.pseudoRandomBytes length, (err, bytes) ->
        callback generate bytes
    return
  (length, callback) ->
    [ length, callback ] = [ callback, length ] if length?.constructor is Function
    length = medium unless length?
    if callback? then async(length, callback) else sync(length)

module.exports = {

  gen_for: gen_for

  hex: gen_for '0123456789abcdef'

  url: gen_for '23456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'

  small

  medium

  large
  
}
