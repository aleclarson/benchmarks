# TODO: figure out async benchmarks
module.exports = (suite) ->

  suite.vary 'non-existent path', ->

  suite.vary 'file path', ->

  suite.vary 'directory path', ->

  setup = ->
    suite.add 'saxon.list', ->

    suite.add 'saxon.isDir', ->

    suite.add 'fs.readdir', ->

    suite.add 'fs.readdirSync', ->

