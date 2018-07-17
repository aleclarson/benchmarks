
require "Type"

module.exports = (suite) ->
  value = type1 = type2 = type3 = null

  isType = require "isType"
  isValid = require "isValid"
  valido = require "valido"

  optional = (type) ->
    type = valido.get type
    return valido
      test: (value) -> value is undefined or type.test value
      error: -> Error()

  suite.add "isType", ->
    isType value, type1

  suite.add "isValid", ->
    isValid value, type2

  suite.add "isValid (cached)", ->
    isValid value, type3

  suite.add "valido.get().test", ->
    valido.get(type2).test value

  suite.vary "number", ->
    value = 1
    type1 = Number
    type2 = "number"
    type3 = valido.get type2

  suite.vary "number|string", ->
    value = "hello"
    type1 = Number.or String
    type2 = "number|string"
    type3 = valido.get type2

  suite.vary "number?", ->
    value = 1
    type1 = Number.Maybe
    type2 = "number?"
    type3 = optional "number"

  suite.vary "number? (undefined)", ->
    value = undefined

