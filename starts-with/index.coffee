
module.exports = (suite) ->
  value = null
  pattern = 'abcd'
  regexp = new RegExp '^' + pattern

  suite.add 'String#startsWith', ->
    value.startsWith pattern

  suite.add 'RegExp ^', ->
    regexp.test value

  suite.add 'String#slice + equality', ->
    value.slice(0, pattern.length) is pattern

  suite.vary 'return true', ->
    value = 'abcdefghijklmnop' 

  suite.vary 'return false', ->
    value = 'abcpefghijklmnop' 

