
module.exports = (suite) ->
  s = null

  r = /\[/

  suite.add 'string.indexOf', ->
    s.indexOf '['

  suite.add 'string.includes', ->
    s.includes '['

  suite.add 'regex.test', ->
    r.test s

  suite.vary 'char exists', ->
    s = 'abc[def]'

  suite.vary 'char missing', ->
    s = 'abc{def}'

