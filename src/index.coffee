###
 * keygen
 * https://github.com/devmode/keygen
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
  generate = (bytes) -> (alpha[byte] for byte in bytes).join ''
  fallback = (length) -> (alpha[Math.floor Math.random() * alpha.length] for [1..length]).join ''
  (length, callback) ->
    [ length, callback ] = [ callback, length ] if length?.constructor is Function
    length = medium unless length?
    if callback?
      crypto.randomBytes length, (err, bytes) ->
        return callback fallback length if err?
        callback generate bytes
      return
    else
      try
        generate crypto.randomBytes length
      catch ex
        fallback length

module.exports = {

  gen_for: gen_for

  hex: gen_for '0123456789abcdef'

  url: gen_for '23456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'

  small

  medium

  large
  
}
