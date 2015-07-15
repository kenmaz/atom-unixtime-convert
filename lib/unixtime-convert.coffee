module.exports = UnixtimeConvert =

  activate: (state) ->
    console.log 'activate'
    atom.commands.add 'atom-workspace', 'unixtime-convert:convert', => @convert(false)

  convert: ->
    console.log 'convert'

    workspace = atom.workspace
    editor = workspace.getActiveTextEditor()
    text = editor.getText()
    res = text.replace /\d{10}/g, (word) ->
      d = new Date(parseInt(word) * 1000)

      date = [
        d.getFullYear(),
        d.getMonth()+1,
        d.getDate()
      ].join('/')

      time = [
        ('0'+d.getHours()).slice(-2),
        ('0'+d.getMinutes()).slice(-2),
        ('0'+d.getSeconds()).slice(-2)
      ].join(":")

      return word + " ("+ date + " " + time + ")"

    editor.setText(res)
