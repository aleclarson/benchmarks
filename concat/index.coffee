module.exports = (suite) ->
  arr1 = new Array(10).fill().map Math.random
  arr2 = new Array(10).fill().map Math.random

  res = null

  suite.on 'cycle', ->
    console.log res

  suite.add 'concat', ->
    res = arr1.concat arr2
    return

  suite.add 'push loops', ->
    res = []
    res.push x for x in arr1
    res.push x for x in arr2
    return

  suite.add 'assign loops', ->
    len1 = arr1.length
    len2 = arr2.length
    res = new Array i = len1 + len2
    res[i] = arr2[i - len1] while i-- isnt len1
    res[i] = arr1[i--] while i isnt -1
    return

  push = Function.apply.bind [].push
  suite.add 'push.apply', ->
    res = []
    push res, arr1
    push res, arr2
    return

  suite.add 'slice then push loop', ->
    res = arr1.slice 0
    res.push x for x in arr2
    return

  suite.add 'concat then push loop', ->
    res = arr1.concat()
    res.push x for x in arr2
    return
