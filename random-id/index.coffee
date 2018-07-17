
module.exports = (suite) ->

  suite.add "Math.random().toString(36).slice(2)", ->
    Math.random().toString(36).slice(2)

  suite.add "Random char loop", ->
    randomChars 10

  suite.add "Generate GUID", ->
    generateGUID()

randomChars = do ->
  charset = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz".split ""
  return (len) ->
    chars = []
    index = -1
    while ++index < len
      chars.push charset[Math.floor Math.random() * charset.length]
    return chars.join ""

generateGUID = do ->
  S4 = -> ((0x10000 * (1 + Math.random())) | 0).toString(16).slice 1
  return -> S4() + S4() + "-" + S4() + S4() + "-" + S4() + "-" + S4() + S4() + S4()
  
