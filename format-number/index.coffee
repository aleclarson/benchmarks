
module.exports = (suite) ->
  n = null

  regex = /(?=(?:\d{3})+$)(?!\b)/g

  suite.add 'Replace using regex', ->
    s = String(n).split '.'
    (s[0].replace /(?=(?:\d{3})+$)(?!\b)/g, ',') +
    (if s[1] then '.' + s[1] else '')

  suite.add 'Replace using regex (cached)', ->
    s = String(n).split '.'
    (s[0].replace regex, ',') +
    (if s[1] then '.' + s[1] else '')

  suite.add 'Split with empty string', ->
    parts = String(n).split '.'
    parts[0] = parts[0].split ''
    chars =
      if rem = parts[0].length % 3
      then parts[0].splice 0, rem
      else []
    parts[0].forEach (char, index) ->
      if chars.length and !(index % 3)
      then chars.push ',' + char
      else chars.push char
      return
    if parts[1]
      chars.push '.' + parts[1]
    return chars.join ''

  suite.vary 'long integer', ->
    n = 1234567890987654321

  suite.vary 'short integer', ->
    n = 1234567

  suite.vary 'short float', ->
    n = 1.25

