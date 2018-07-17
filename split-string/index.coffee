
module.exports = (suite) ->
  string = null
  delimiter = "|"
  regex1 = /[^|]+/g
  regex2 = /[^|]*/g

  suite.add "while loop", ->
    res = []
    index = -1
    start = 0
    while ++index < string.length
      if string[index] is delimiter
        res.push string.slice start, index
        start = index + 1
    return res

  suite.add "split", ->
    string.split delimiter

  suite.add "match(regex1)", ->
    string.match regex1

  suite.add "match(regex2)", ->
    string.match regex2

  suite.add "regex1.exec", ->
    res = []
    regex1.lastIndex = 0
    while match = regex1.exec string
      res.push match[1]
    return res

  suite.add "regex2.exec", ->
    res = []
    regex2.lastIndex = 0
    while (match = regex2.exec string)[1]
      res.push match[1]
    return res

  suite.add "indexOf + slice", ->
    res = []
    str = string
    while 0 < (index = str.indexOf delimiter)
      res.push str.slice 0, index
      str = str.slice index + 1
    return res

  suite.add "indexOf + split", ->
    if 0 < string.indexOf delimiter
      return string.split delimiter
    return string

  suite.add "indexOf + match(regex1)", ->
    if 0 < string.indexOf delimiter
      return string.match regex1
    return string

  suite.vary "no delimiters", ->
    string = "abcdefghi"

  suite.vary "one delimiter", ->
    string = "abcd|efgh"

  suite.vary "many delimiters", ->
    string = "a|b|c|d|e|f"

