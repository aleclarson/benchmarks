
module.exports = (suite) ->
  value = []
  index = 0
  while ++index < 20
    value.push index

  suite.add 'new array', ->
    arr = value.slice()
    arr = []

  suite.add 'array.length = 0', ->
    arr = value.slice()
    arr.length = 0

  suite.add 'array.slice(0, 0)', ->
    arr = value.slice()
    arr = arr.slice 0, 0

  suite.add 'array.length = 0 (when length > 0)', ->
    arr = value.slice()
    arr.length = 0 if arr.length

