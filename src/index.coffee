###
 * keygen
 * https://github.com/devmode/keygen
 *
 * Copyright (c) 2014 DevMode, Inc.
 * Licensed under the MIT license.
###

crypto = require 'crypto'

gen_for = (alpha) ->
  alpha = (alpha for it in [0..256 / alpha.length + 1]).join('').split('')
  (length=22) ->
    try
      (alpha[byte] for byte in crypto.randomBytes(length)).join ''
    catch ex
      (alpha[Math.floor Math.random() * alpha.length] for [1..length]).join ''

module.exports =

  gen_for: gen_for

  hex: gen_for '0123456789abcdef'

  url: gen_for '23456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'

  small: 11

  medium: 22

  large: 44
