# the 'hex' and 'url' key generators are tuned have a collision probability similar to that 
# of MD5 at a uniqueness factor of 2 (the default) specify a uniqueness factor of 4 for a 
# collision probabiltiy similar to that of SHA256

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


