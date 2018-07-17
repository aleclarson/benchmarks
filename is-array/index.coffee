
module.exports = (suite) ->
  value = []

  # Used to simulate an `instanceof Validator` check.
  Validator = -> null

  {toString} = Object::
  {isArray} = Array

  str = '[object Array]'

  suite.add 'Array.isArray', ->
    Array.isArray value

  suite.add 'Array.isArray (cached)', ->
    isArray value

  suite.add 'toString', ->
    Object::toString.call(value) is '[object Array]'

  suite.add 'toString (cached)', ->
    toString.call(value) is str

  suite.add 'value.constructor', ->
    value and value.constructor is Array

  suite.add 'isType(value, Array)', ->
    unless value instanceof Validator
      value and value.constructor is Array

