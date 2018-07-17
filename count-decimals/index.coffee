
module.exports = (suite) ->
  value = null

  suite.add 'string.split', ->
    decs = String(value).split('.')[1]
    if decs then decs.length else 0

  suite.add 'string.split + modulo', ->
    return 0 unless value % 1
    return String(value).split('.')[1].length

  suite.add 'string.indexOf', ->
    str = String(value)
    index = str.indexOf('.')
    if index isnt -1
    then str.length - index - 1
    else 0

  suite.add 'string.indexOf + modulo', ->
    return 0 unless value % 1
    str = String(value)
    str.length - str.indexOf('.') - 1

  suite.vary '100000.1', ->
    value = 100000.1

  suite.vary '1.000001', ->
    value = 1.000001

  suite.vary '1', ->
    value = 1

