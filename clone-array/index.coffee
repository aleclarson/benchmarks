module.exports = (suite) ->
  clone = null
  
  # Bound slice
  slice = Function.call.bind(Array.prototype.slice)
  
  # For array.map()
  noop = (arg) -> arg

  sizes = [5, 10, 20, 50, 100, 200, 500, 1000]
  sizes.forEach (size) ->
    suite.vary 'array.length == ' + size, ->
      arr = new Array(size).fill(0).map(Math.random)
   
      suite.add 'slice(0)', ->
        clone = arr.slice 0
        return

      suite.add 'bound slice(0)', ->
        clone = slice arr, 0
        return

      suite.add 'for loop', ->
        len = arr.length
        clone = new Array len
        for i in [0..len]
          clone[i] = arr[i]
        return

      suite.add 'while loop', ->
        i = arr.length
        clone = new Array i
        while i--
          clone[i] = arr[i]
        return

      suite.add 'spread', ->
        clone = [...arr]
        return

      suite.add 'array.map', ->
        clone = arr.map noop
        return

      suite.add 'Array.apply', ->
        clone = Array.apply undefined, arr
        return

      suite.add 'concat', ->
        clone = [].concat arr
        return

      suite.add 'concat no arg', ->
        clone = arr.concat()
        return
