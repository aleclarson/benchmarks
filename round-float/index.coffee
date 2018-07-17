
module.exports = (suite) ->
  value = null

  suite.add 'toFixed', ->
    Number value.toFixed 2

  suite.add 'Math.round', ->
    Math.round(value * 100) / 100

  suite.add 'e+2', ->
    Number Math.round(value + 'e+2') + 'e-2'

  suite.add 'Math.round (no errors)', ->
    Math.round(100 * value + 0.00000000000001) / 100

  suite.vary '1.005', ->
    value = 1.005

  suite.vary '1e19', ->
    value = 1e19

