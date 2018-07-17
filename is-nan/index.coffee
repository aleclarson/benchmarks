
# Tests if a string is a number.
module.exports = (suite) ->
  value = null

  r1 = /^[0-9+]$/
  r2 = /^[0-9]/

  suite.add 'isNaN Number(value)', ->
    isNaN Number value

  suite.add 'Number(value) >= 0', ->
    Number(value) >= 0

  suite.add 'isNaN parseInt(value)', ->
    isNaN parseInt value

  suite.add 'parseInt(value) >= 0', ->
    parseInt(value) >= 0

  suite.add 'numbers only regex', ->
    /^[0-9]+$/.test value

  suite.add 'numbers only regex (cached)', ->
    r1.test value

  suite.add 'regex test first char', ->
    /^[0-9]/.test value

  suite.add 'regex test first char (cached)', ->
    r2.test value

  suite.vary 'number string', ->
    value = '1000'

  suite.vary 'alpha string', ->
    value = 'abcd'

