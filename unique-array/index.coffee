
module.exports = (suite) ->
  keys = null

  suite.add '[].indexOf', ->
    arr = []
    for key in keys
      arr.push key if ~arr.indexOf key
    return

  suite.add 'Object.keys', ->
    obj = {}
    obj[key] = 1 for key in keys
    arr = Object.keys obj
    return

  suite.add 'Object.keys (hasOwn)', ->
    obj = {}
    for key in keys
      obj[key] = 1 if obj.hasOwnProperty key
    arr = Object.keys obj
    return

  suite.add 'Array.from', ->
    set = new Set
    set.add key for key in keys
    arr = Array.from set
    return

  suite.vary 'With duplicates', ->
    keys = 'a b c d e f e d c b a'.split ' '

  suite.vary 'Without duplicates', ->
    keys = 'a b c d e f g h i j k'.split ' ' 

  return suite

