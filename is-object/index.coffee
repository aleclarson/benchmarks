
module.exports = (suite) ->
  value = {}

  # Used to simulate an `instanceof Validator` check.
  Validator = -> null

  {toString} = Object::

  str = '[object Object]'

  suite.add 'toString', ->
    Object::toString.call(value) is '[object Object]'

  suite.add 'toString (cached)', ->
    toString.call(value) is str

  suite.add 'value.constructor', ->
    value and value.constructor is Object

  suite.add 'isType(value, Object)', ->
    unless value instanceof Validator
      value and value.constructor is Object

  suite.add '!getProto(value)', ->
    value and ((value.constructor is Object) or !Object.getPrototypeOf(value))

