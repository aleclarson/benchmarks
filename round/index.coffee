
module.exports = (suite) ->
  value = null
  round = require "round"

  suite.add 'round to 1 decimal', ->
    round value, 1

  suite.add 'round to 2 decimals', ->
    round value, 2

  suite.add 'round to 3 decimals', ->
    round value, 3

  suite.vary '1.005', ->
    value = 1.005

  suite.vary '1e19', ->
    value = 1e19

  suite.vary '0', ->
    value = 0

  suite.vary '1/3', ->
    value = 1/3

