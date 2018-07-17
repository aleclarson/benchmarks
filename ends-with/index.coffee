
module.exports = (suite) ->
  value = null
  regex = /\?$/

  suite.add ".endsWith", ->
    value.endsWith "?"

  suite.add "RegExp", ->
    regex.test value

  suite.add ".slice", ->
    "?" is value.slice -1

  suite.add "[length - 1]", ->
    value[value.length - 1] is "?"

  suite.vary "match", ->
    value = "abcefghijklmnop?"

  suite.vary "no match", ->
    value = "abcefghijklmnop"

