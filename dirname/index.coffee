module.exports = (suite) ->
  path = require 'path'

  file = process.cwd() + '/jsdgoiwer/wrhioqhr/qhwieo'
  res = null

  suite.add 'path.dirname', ->
    i = 0
    res = file
    while i++ < 3
      res = path.dirname res
    return

  suite.add 'lastIndexOf', ->
    i = 0
    j = file.length
    while i++ < 3
      j = file.lastIndexOf path.sep, j - 1
    res = file.slice 0, j
    return

  suite.on 'cycle', ->
    console.log 'res =', JSON.stringify res

