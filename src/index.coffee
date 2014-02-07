###
 * keygen
 * https://github.com/devmode/keygen
 * 
 * Copyright (c) 2014 DevMode, Inc.
 * Licensed under the MIT license.
###

gen_for = (base, alpha) ->
    (uq_factor=2) ->
      (alpha.charAt Math.floor(Math.random() * alpha.length) for [1..base * uq_factor]).join ''

module.exports = 

  gen_for: gen_for

  hex: gen_for 16, '0123456789abcdef'

  url: gen_for 11, '23456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'

  small: 1

  medium: 2

  large: 4


